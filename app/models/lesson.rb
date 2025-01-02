class Lesson < ApplicationRecord


  # associations
  belongs_to :course
  has_many :progresses, dependent: :destroy
  has_many :users, through: :progresses
end
