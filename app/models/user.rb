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
  has_many :skill_users
  has_many :skills, through: :skill_users
  has_many :hobby_users
  has_many :hobbies, through: :hobby_users
  has_one :company
  after_commit :add_default_picture, on: [:create]

  private

  def add_default_picture
    return if profile_pic.attached?
    profile_pic.attach(io: File.open("#{Rails.root}/app/assets/images/profile.png"), filename: "profile.png", content_type: "image/png")
  end
end
