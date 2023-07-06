class Question < ApplicationRecord
  validates :content, :title, presence: true
  has_many :answers
end
