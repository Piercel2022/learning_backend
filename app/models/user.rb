class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

   # Constants for roles
   ROLES = %w[apprenant admin].freeze

   # Associations
  has_many :progresses
  has_many :lessons, through: :progresses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :role, inclusion: { in: ROLES }

  def admin?
    role == 'admin'
  end

  def apprenant?
    role == 'apprenant'
  end
  
end
