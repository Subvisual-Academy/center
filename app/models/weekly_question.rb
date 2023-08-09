class WeeklyQuestion < ApplicationRecord
  belongs_to :question
  validates :week, presence: true, uniqueness: true
  default_scope { order("created_at DESC") }
end
