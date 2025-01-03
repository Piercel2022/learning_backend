class Course < ApplicationRecord


    has_many :lessons, dependent: :destroy
    belongs_to :created_by, class_name: "User"
    
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates :difficulty_level, presence: true, inclusion: { in: %w[beginner intermediate advanced] }

    def self.ransackable_associations(auth_object = nil)
        ["created_by", "lessons"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "created_by_id", "description", "difficulty_level", "id", "id_value", "title", "updated_at"]
    end
end