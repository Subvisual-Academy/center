class QuestionsAnswersController < ApplicationController
  before_action :authorize_request

  # GET /question/1/answers
  def index
    @answers = Answer.all.where(question_id: params["question_id"])
    render json: @answers
  end
end
