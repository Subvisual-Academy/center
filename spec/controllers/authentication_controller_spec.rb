require "rails_helper"

RSpec.describe AuthenticationController do
  describe "GET login" do
    it "returns a 200" do
      user = create(:user)

      get :login, params: {email: user.email, password: user.password}

      expect(response).to have_http_status(:ok)
    end

    it "JSON body response contains expected attributes" do
      user = create(:user)

      get :login, params: {email: user.email, password: user.password}
      json_response = JSON.parse(response.body)

      expect(json_response.keys).to match_array(["token", "exp", "user"])
    end
  end
end
