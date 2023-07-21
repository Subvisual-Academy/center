class WeeklyFriendsController < ApplicationController
  def show
    user = params["id"].to_i
    weekly_activity = WeeklyActivity.where(user_1_id: user).or(WeeklyActivity.where(user_2_id: user)).first

    if weekly_activity.nil?
      render json: user
    elsif user == weekly_activity.user_1_id
      render json: weekly_activity.user_2_id
    else
      render json: weekly_activity.user_1_id
    end
  end
end
