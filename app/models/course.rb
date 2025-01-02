class Course < ApplicationRecord

    has_many :lessons, dependent: :destroy
    belongs_to :created_by, class_name: "User"
    
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates :difficulty_level, presence: true, inclusion: { in: %w[beginner intermediate advanced] }
end