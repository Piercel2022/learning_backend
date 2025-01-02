class CoursesController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @courses = Course.all
      render json: @courses
    end
  
    def show
      @course = Course.find(params[:id])
      render json: @course, include: :lessons
    end
end
  