class SkillsController < ApplicationController
  # GET /answers
  def index
    @skills = Skill.all

    render json: @skills
  end
end
