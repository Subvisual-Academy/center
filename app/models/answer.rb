class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :body, presence: true
end
