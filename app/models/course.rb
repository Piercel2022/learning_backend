class Course < ApplicationRecord
    has_many :lessons, dependent: :destroy
    validates :title, presence: true
    validates :description, presence: true
end