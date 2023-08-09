class Question < ApplicationRecord
  validates :body, presence: true
  has_many :answers
  default_scope { order("created_at DESC") }
end
