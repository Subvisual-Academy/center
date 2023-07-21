require "rails_helper"

RSpec.describe "Weekly Question", type: :request do
  describe "GET show" do
    it "returns a 200" do
      create(:user)
      question = create(:question)
      weekly_question = WeeklyQuestion.create(question: question, week: Date.today.end_of_week + 1.day)
      user = create(:user, email: "example2@gmail.com")
      post "/auth/login", params: {email: user.email, password: user.password}
      parsed_body = JSON.parse(response.body)
      header = {"Authorization" => "Bearer #{parsed_body["token"]}"}

      get "/weekly_question", headers: header

      expect(response.body).to include(weekly_question.question.id.to_s)
      expect(response.status).to eq(200)
    end
  end
end
