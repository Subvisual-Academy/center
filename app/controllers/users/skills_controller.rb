class Users::SkillsController < ApplicationController
  def index
    render json: User.find(params[:user_id]).skills
  end
end
