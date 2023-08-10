class Users::SkillsController < ApplicationController
  def index
    render json: User.find(params[:user_id]).skills.pluck(:name)
  end
end
