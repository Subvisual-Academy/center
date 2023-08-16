class Users::SkillsController < ApplicationController
  before_action :authorize_request

  def index
    render json: User.find(params[:user_id]).skills
  end

  def create
    skills_params[:names].each do |skill_name|
      @skill = Skill.find_by_name(skill_name)
      user_skill = SkillUser.new(user_id: params[:user_id], skill_id: @skill.id)
      unless user_skill.save
        render json: user_skill.errors, status: :unprocessable_entity
      end
    end

    render json: SkillUser.where(user_id: params[:user_id]), status: :created
  end

  def skills_params
    params.permit(names: [])
  end
end
