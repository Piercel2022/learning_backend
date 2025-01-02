class Api::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create, :login]

  def create
    user = User.new(user_params)
    if user.save
      render json: { message: 'User created successfully', user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def logout
    # Invalidate token or clear session
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end