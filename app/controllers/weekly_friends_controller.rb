class WeeklyFriendsController < ApplicationController
  def show
    user = User.find(params["id"])
    weekly_activity = WeeklyActivity.active.includes_user(user.id)

    if weekly_activity.nil?
      render json: user
    elsif user.id == weekly_activity.pluck(:user_1_id)
      render json: User.where(id: weekly_activity.pluck(:user_2_id))
    else
      render json: User.where(id: weekly_activity.pluck(:user_1_id))
    end
  end
end
