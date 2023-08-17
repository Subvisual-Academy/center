class WeeklyFriendsController < ApplicationController
  def show
    user = User.find(params["id"])
    active_activities = WeeklyActivity.active

    if active_activities.where(user_1: user).exists?
      render json: UserSerializer.new(active_activities.find_by(user_1: user).user_2).serialize

    elsif active_activities.where(user_2: user).exists?
      render json: UserSerializer.new(active_activities.find_by(user_2: user).user_1).serialize

    else
      render json: {error: "not_found"}, status: 404
    end
  end
end
