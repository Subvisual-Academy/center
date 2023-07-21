require "rails_helper"

RSpec.describe Questions::AnswersController do
  describe "GET index" do
    it "returns a boolean" do
      user = create(:user)
      question = create(:question)
      create(:answer, user: user, question: question)
      get :index, params: {question_id: question.id}
      parsed_body = JSON.parse(response.body)

      expect(parsed_body["question_id"] == question.id)
    end
  end
end
