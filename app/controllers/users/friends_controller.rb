class Users::FriendsController < ApplicationController
  def index
    current_user = params["user_id"].to_i
    weekly_activity = WeeklyActivity.where("user_1_id = ? OR user_2_id = ?", current_user, current_user).first

    if weekly_activity.user_1_id == current_user
      render json: weekly_activity.user_2
    else
      render json: weekly_activity.user_1
    end
  end
end
