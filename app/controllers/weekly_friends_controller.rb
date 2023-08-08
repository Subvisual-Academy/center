class WeeklyFriendsController < ApplicationController
  def show
    user = User.find(params["id"])
    active = WeeklyActivity.active

    if active.where(user_1_id: user.id).exists?
      render json: active.find_by(user_1_id: user.id).user_2

    elsif active.where(user_2_id: user.id).exists?
      render json: active.find_by(user_2_id: user.id).user_1

    else
      render json: user
    end
  end
end
