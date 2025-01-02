class Progress < ApplicationRecord

  belongs_to :user
  belongs_to :lesson

  # Validations
  validates :user_id, uniqueness: { scope: :lesson_id, message: 'can only track progress once per lesson' }
  validates :status, inclusion: { in: %w[incomplete complete] }
end
