class Users::HobbiesController < ApplicationController
  def index
    render json: User.find(params[:user_id]).hobbies.pluck(:name)
  end
end
