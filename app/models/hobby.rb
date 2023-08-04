class Hobby < ApplicationRecord
  validates :name, presence: true
  has_many :hobby_users
  has_many :users, through: :hobby_users
end
