class WeeklyActivity < ApplicationRecord
  belongs_to :user_1, class_name: "User"
  belongs_to :user_2, class_name: "User"

  scope :active, -> { where(active: true) }

  scope :includes_user, ->(user_id) { where(user_1_id: user_id).or(where(user_2_id: user_id)) }
end
