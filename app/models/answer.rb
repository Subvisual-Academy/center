class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :body, presence: true
  validates :user_id, uniqueness: {scope: :question_id}
  default_scope { order("created_at DESC") }
end
