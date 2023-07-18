require "rails_helper"

RSpec.describe AuthenticationController, type: :controller do
  describe "GET login" do
    it "returns a 200" do
      user = User.create(email: "email@gmail.com", password: "password")
      get :login, params: {email: user.email, password: user.password}
      expect(response).to have_http_status(:ok)
    end
  end
end
