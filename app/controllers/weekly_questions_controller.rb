class WeeklyQuestionsController < ApplicationController
  before_action :authorize_request

  # GET all the weekly questions with question body info
  def index
    serialized = WeeklyQuestionSerializer.new(WeeklyQuestion.where("week <= ?", Time.now)).serialize
    render json: serialized
  end

  # GET this weeks question
  def show
    @week_question = WeeklyQuestion.find_by_week(Date.today.beginning_of_week)
    render json: @week_question, status: :ok
  end
end
