require "rails_helper"

RSpec.describe "Answers of a question", type: :request do
  context "GET index" do
    it "lists the answers to a specific question sucessfully" do
      user = create(:user)
      question = create(:question)
      create(:answer, user: user, question: question)
      token = sign_in_as(user)
      header = {"Authorization" => "Bearer #{token}"}

      get "/questions/#{question.id}/answers", headers: header

      expect(response.body).to include(question.id.to_s)
      expect(response.status).to eq(200)
    end
  end
end
