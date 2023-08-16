class Users::HobbiesController < ApplicationController
  before_action :authorize_request

  def index
    render json: User.find(params[:user_id]).hobbies
  end

  def create
    hobbies_params[:names].each do |hobby_name|
      @hobby = Hobby.find_by_name(hobby_name)
      user_skill = HobbyUser.new(user_id: params[:user_id], hobby_id: @hobby.id)
      unless user_skill.save
        render json: user_skill.errors, status: :unprocessable_entity
      end
    end

    render json: HobbyUser.where(user_id: params[:user_id]), status: :created
  end

  def hobbies_params
    params.permit(names: [])
  end
end
