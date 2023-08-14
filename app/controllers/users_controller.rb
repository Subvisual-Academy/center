class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{user_id}
  def show
    render json: Alba.serialize(@user), status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    upload_picture(@user, user_params[:profile_pic])

    if @user.save
      render json: UserSerializer.new(@user).serialize, status: :created
    else
      render json: {errors: @user.errors.full_messages},
        status: :unprocessable_entity
    end
  end

  # PUT /users/{user_id}
  def update
    unless @user.update(user_params)
      render json: {errors: @user.errors.full_messages},
        status: :unprocessable_entity
    end
    render json: UserSerializer.new(@user).serialize
  end

  # DELETE /users/{user_id}
  def destroy
    @user.destroy
  end

  private

  def upload_picture(user, profile_pic)
    return unless profile_pic
    user.profile_pic.attach(io: StringIO.new(profile_pic.read),
      filename: profile_pic.original_filename,
      content_type: profile_pic.content_type)
  end

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {errors: "User not found"}, status: :not_found
  end

  def user_params
    params.permit(
      :name, :email, :password, :password_confirmation, :bio, :base_office, :role, :company_id, :profile_pic
    )
  end
end
