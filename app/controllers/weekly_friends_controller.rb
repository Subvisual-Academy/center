class WeeklyFriendsController < ApplicationController
  def show
    user = User.find(params["id"])
    active_activities = WeeklyActivity.active

    activity_user = find_activity_user(active_activities, user)

    if activity_user
      return render json: serialize_user(activity_user)
    end

    render json: {error: "not_found"}, status: 404
  end

  private

  def find_activity_user(activities, user)
    if activities.where(user_1: user).exists?
      return activities.find_by(user_1: user).user_2
    end

    if activities.where(user_2: user).exists?
      return activities.find_by(user_2: user).user_1
    end

    nil
  end
end
