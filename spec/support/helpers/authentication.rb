module Helpers
  module Authentication
    def sign_in_as(user)
      post "/auth/login", params: {email: user.email, password: user.password}
      parsed_body = JSON.parse(response.body)
      parsed_body["token"]
    end
  end
end
