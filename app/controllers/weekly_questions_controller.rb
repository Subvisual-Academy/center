class WeeklyQuestionsController < ApplicationController
  before_action :authorize_request

  # GET all the weekly questions with question body info
  def index
    weekly_questions = WeeklyQuestion.all

    ret = weekly_questions.map do |week_question|
      question = Question.find(week_question.question_id)
      {
        weekly_question: week_question,
        question_body: question.body
      }
    end
    render json: ret.to_json
  end

  # GET this weeks question
  def show
    @week_question = WeeklyQuestion.find_by_week(Date.today.end_of_week + 1.day)
    render json: @week_question, status: :ok
  end
end
