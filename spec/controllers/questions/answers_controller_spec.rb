require "rails_helper"

RSpec.describe Questions::AnswersController, type: :controller do
  describe "GET index" do
    it "returns a boolean" do
      user = User.create(email: "email@gmail.com", password: "password")
      question = Question.create(title: "Title", content: "A Question")
      Answer.create(user: user, question: question, body: "An Answer")
      get :index, params: {question_id: question.id}
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["question_id"] == question.id)
    end
  end
end
