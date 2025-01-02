
Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    get "tags/index"
    
    # User routes
    resources :users, only: [:show, :create, :update, :destroy] do
      collection do
        post :login   # POST /api/users/login
        post :logout  # POST /api/users/logout
      end
    end

    # Course routes
    resources :courses, only: [:index, :show, :create, :update, :destroy] do
      resources :lessons, only: [:index] # Nested: GET /api/courses/:course_id/lessons
    end

    # Lesson routes
    resources :lessons, only: [:show, :create, :update, :destroy] do
      resources :quizzes, only: [:index] # Nested: GET /api/lessons/:lesson_id/quizzes
    end

    # Quiz routes
    resources :quizzes, only: [:show, :create, :update, :destroy] do
      post :submit, on: :member # POST /api/quizzes/:id/submit
    end

    # Additional routes for tags and search
    get 'tags', to: 'tags#index'        # GET /api/tags
    get 'search', to: 'search#index'   # GET /api/search
  end

  # Catch-all route for unmatched paths (optional, for debugging)
  #match '*path', to: 'application#not_found', via: :all
end
