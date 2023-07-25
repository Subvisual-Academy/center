require "rails_helper"

RSpec.describe "Weekly Question" do
  context "GET show" do
    it "provides the weekly question for the given user" do
      user = create(:user)
      question = create(:question)
      weekly_question = WeeklyQuestion.create(question: question, week: Date.today.end_of_week + 1.day)
      token = sign_in_as(user)
      header = {"Authorization" => "Bearer #{token}"}

      get weekly_question_path, headers: header

      expect(response.body).to include(weekly_question.question.id.to_s)
      expect(response.status).to eq(200)
    end
  end
end
