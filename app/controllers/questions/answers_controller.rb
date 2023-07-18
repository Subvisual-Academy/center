class Questions::AnswersController < ApplicationController
  before_action :authorize_request

  # GET /question/1/answers
  def index
    @answers = Answer.where(question_id: params["question_id"])
    render json: @answers
  end
end
