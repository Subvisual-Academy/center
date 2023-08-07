class WeeklyFriendsController < ApplicationController
  def show
    user = User.find_by_id(params["id"])
    active_activities = WeeklyActivity.where(active: true)
    weekly_activity = active_activities.where(user_1_id: user).or(WeeklyActivity.where(user_2_id: user)).first

    if weekly_activity.nil?
      render json: user
    elsif user == weekly_activity.user_1
      render json: weekly_activity.user_2
    else
      render json: weekly_activity.user_1
    end
  end
end
