require "rails_helper"

RSpec.describe "Weekly Question" do
  context "GET show" do
    it "provides the weekly question for the given user" do
      company = create(:company)
      user = create(:user, company: company)
      question = create(:question)
      weekly_question = WeeklyQuestion.create(question: question, week: Date.today.end_of_week + 1.day)
      header = sign_in_as(user)

      get weekly_question_path, headers: header

      expect(response.body).to include(weekly_question.question.id.to_s)
      expect(response.status).to eq(200)
    end
  end
end
