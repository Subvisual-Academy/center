class CreateWeeklyActivitiesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user_ids = User.all.order("RANDOM()").pluck(:id)

    unused_user_id = User.where(not_paired: true)&.ids
    return unless unused_user_id

    user_ids = user_ids.unshift(unused_user_id).uniq

    User.update(unused_user_id, not_paired: false)

    user_ids.each_slice(2) do |user_1, user_2|
      if user_2
        WeeklyActivity.create(user_1_id: user_1, user_2_id: user_2)
      else
        User.find_by_id(user_1).update(not_paired: true)
      end
    end
  end
end
