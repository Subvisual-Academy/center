class WeeklyQuestionsController < ApplicationController
  before_action :authorize_request

  # GET all the weekly questions with question body info
  def index
    serialized = WeeklyQuestionSerializer.new(WeeklyQuestion.all).serialize
    render json: serialized
  end

  # GET this weeks question
  def show
    @week_question = WeeklyQuestion.find_by_week(Date.today.end_of_week + 1.day)
    render json: @week_question, status: :ok
  end
end
