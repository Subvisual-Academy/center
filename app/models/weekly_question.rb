class WeeklyQuestion < ApplicationRecord
  belongs_to :question
  validates :week, presence: true, uniqueness: true
end
