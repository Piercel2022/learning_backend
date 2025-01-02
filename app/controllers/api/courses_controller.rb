
class Api::CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    courses = Course.all
    render json: courses, status: :ok
  end

  def show
    course = Course.find_by(id: params[:id])
    if course
      render json: course, status: :ok
    else
      render json: { error: 'Course not found' }, status: :not_found
    end
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: { message: 'Course created successfully', course: course }, status: :created
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    course = Course.find(params[:id])
    if course.update(course_params)
      render json: { message: 'Course updated successfully', course: course }, status: :ok
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    render json: { message: 'Course deleted successfully' }, status: :ok
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :tags)
  end
end
