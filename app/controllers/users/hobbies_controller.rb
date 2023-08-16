class Users::HobbiesController < ApplicationController
  def index
    render json: User.find(params[:user_id]).hobbies
  end
end
