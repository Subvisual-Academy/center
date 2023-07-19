require "rails_helper"

RSpec.describe WeekQuestionController, type: :controller do
  include ActiveJob::TestHelper
  describe "GET login" do
    it "returns a 200" do
      Question.create(body: "A Question")
      weekly_question = CreateWeeklyQuestionJob.perform_now
      get :show
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["question_id"] == weekly_question.question.id)
    end
  end
end
