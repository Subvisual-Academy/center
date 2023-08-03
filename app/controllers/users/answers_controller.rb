class Users::AnswersController < ApplicationController
  def index
    render json: Answer.where(user_id: params[:user_id])
  end
end
