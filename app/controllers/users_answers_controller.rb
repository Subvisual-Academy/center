class UsersAnswersController < ApplicationController
  def index
    user_answers = 

    if user_answers.nil?
      render json: [], status: :ok
    else
      render json: Answer.where(user_id: params[:id])
    end
  end
end
