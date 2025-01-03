class Lesson < ApplicationRecord


  # associations
  belongs_to :course
  has_many :progresses, dependent: :destroy
  has_many :users, through: :progresses

  validates :title, presence: true, uniqueness: { scope: :course_id }
  validates :content, presence: true
  validates :video_url, format: { with: /\A(http|https):\/\/[\S]+\z/, message: 'must be a valid URL' }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["content", "course_id", "created_at", "id", "id_value", "title", "updated_at", "video_url"]
  end
end
