class Course < ApplicationRecord

    has_many :lessons, dependent: :destroy
    
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
  validates :difficulty_level, presence: true, inclusion: { in: %w[beginner intermediate advanced] }
end