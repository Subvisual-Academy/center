require "rails_helper"

RSpec.describe "Answers of a question" do
  context "GET index" do
    it "lists the answers to a specific question sucessfully" do
      company = create(:company)
      user = create(:user, company_id: company.id)
      question = create(:question)
      create(:answer, user: user, question: question)
      header = sign_in_as(user)

      get question_answers_path(question.id), headers: header

      expect(response.body).to include(question.id.to_s)
      expect(response.status).to eq(200)
    end
  end
end
