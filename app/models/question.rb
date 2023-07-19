class Question < ApplicationRecord
  validates :body, presence: true
  has_many :answers
end
