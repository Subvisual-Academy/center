class CreateWeeklyActivitiesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    unused_user = User.find_by(not_paired: true)
    return unless unused_user

    user_ids = User.where(not_paired: false).order("RANDOM()").pluck(:id).unshift(unused_user.id)

    unused_user.update(not_paired: false)

    user_ids.each_slice(2) do |user_1, user_2|
      if user_2
        WeeklyActivity.create(user_1_id: user_1, user_2_id: user_2)
      else
        User.find_by_id(user_1).update(not_paired: true)
      end
    end
  end
end
