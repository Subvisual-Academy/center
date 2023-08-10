class ApplicationController < ActionController::API
  def not_found
    render json: {error: "not_found"}
  end

  def authorize_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {errors: e.message}, status: :unauthorized
    end
  end

  def upload_picture(user)
    user_params = request.path_parameters
    if user_params[:profile_pic]
      user.profile_pic.attach(io: StringIO.new(user_params[:profile_pic].read),
        filename: user_params[:profile_pic].original_filename,
        content_type: user_params[:profile_pic].content_type)
    end
  end
end
