class Skill < ApplicationRecord
  validates :name, presence: true

  has_many :skill_users
  has_many :users, through: :skill_users
end
