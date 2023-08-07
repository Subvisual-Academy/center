class WeeklyFriendsController < ApplicationController
  def show
    user = User.find(params["id"])
    weekly_activity = WeeklyActivity.active.includes_user(user.id)

    if weekly_activity.nil?
      render json: user
    elsif user == weekly_activity.user_1
      render json: weekly_activity.user_2
    else
      render json: weekly_activity.user_1
    end
  end
end
