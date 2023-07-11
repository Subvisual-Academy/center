class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password,
    length: {minimum: 6},
    if: -> { new_record? || !password.nil? }
  has_many :answers
  enum :base_office, {braga: 0, coimbra: 1}
end
