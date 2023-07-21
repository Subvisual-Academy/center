require "rails_helper"

RSpec.describe "Answers of a question", type: :request do
  describe "GET index" do
    it "returns http success" do
      user = create(:user, email: "example2@gmail.com")
      question = create(:question)
      create(:answer, user: user, question: question)
      post "/auth/login", params: {email: user.email, password: user.password}
      parsed_body = JSON.parse(response.body)
      header = {"Authorization" => "Bearer #{parsed_body["token"]}"}

      get "/questions/#{question.id}/answers", headers: header

      expect(response.body).to include(question.id.to_s)
      expect(response.status).to eq(200)
    end
  end
end
