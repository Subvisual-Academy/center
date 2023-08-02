class UsersAnswersController < ApplicationController
    def index
        user_answers= Answers.find_by_user_id(params[:id])
    
        if user_answers.nil?
          render json: [], status: :ok
        else
          render json: user_answers
        end
    end       
end