class CourseSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :title, :description
  has_many :lessons
end
