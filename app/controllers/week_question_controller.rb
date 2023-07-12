class WeekQuestionController < ApplicationController
    before_action :authorize_request
  
    # GET this weeks question
    def show
        @week_question = WeeklyQuestion.find_by_week(Date.today.end_of_week + 1.day)
        render json: @week_question, status: :ok
    end
end