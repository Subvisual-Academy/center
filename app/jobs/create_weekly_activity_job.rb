class CreateWeeklyActivityJob < ApplicationJob
  queue_as :default

  def perform(*args)
    @user_ids = User.all.order("RANDOM()").pluck(:id)
    @unused_user_id = User.find_by(left: true)&.id

    return unless @unused_user_id

    @user_ids = @user_ids.unshift(@unused_user_id).uniq
    @users = @user_ids.collect { |id| User.find(id) }

    User.update(@unused_user_id, left: false)

    @users.each_slice(2) do |user_1, user_2|
      if user_2
        WeeklyActivity.create(user_1: user_1, user_2: user_2)
      else
        user_1.update(left: true)
      end
    end
  end
end
