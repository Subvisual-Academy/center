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
  after_commit :add_default_picture, on: [:create]

  private def add_default_picture
    unless profile_pic.attached?
      profile_pic.attach(io: File.open("#{Rails.root}/app/assets/images/profile.png"), filename: "profile.png", content_type: "image/png")
    end
  end
end
