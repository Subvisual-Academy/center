require "rails_helper"

RSpec.describe "Authentication", type: :request do
  context "GET login" do
    it "verifies if the user exists and is validated" do
      user = create(:user)

      post "/auth/login", params: {email: user.email, password: user.password}

      expect(response).to have_http_status(200)
    end

    it "ensures the JSON body response contains the expected attributes" do
      user = create(:user)

      post "/auth/login", params: {email: user.email, password: user.password}

      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["token", "exp", "user"])
    end
  end
end
