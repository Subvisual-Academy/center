class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      profile_pic_url = if Rails.env.development? || Rails.env.production?
        @user.profile_pic.url
      else
        @user.profile_pic.attachment.key
      end

      render json: {
        token: token,
        exp: time.strftime("%m-%d-%Y %H:%M"),
        user: @user.id,
        profile_pic: profile_pic_url
      }, status: :ok

    else
      render json: {error: "unauthorized"}, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
