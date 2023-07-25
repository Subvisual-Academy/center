module Helpers
  module Authentication
    def sign_in_as(user)
      post "/auth/login", params: {email: user.email, password: user.password}
      parsed_body = JSON.parse(response.body)
      {"Authorization" => "Bearer #{parsed_body["token"]}"}
    end
  end
end
