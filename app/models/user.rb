class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_pic
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password,
    length: {minimum: 6},
    if: -> { new_record? || !password.nil? }
  has_many :answers
  has_many :weekly_activities
  enum :base_office, {braga: 0, coimbra: 1}
end
