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

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {errors: "User not found"}, status: :not_found
  end

  def user_params
    params.permit(
      :name, :email, :password, :password_confirmation, :bio, :base_office, :role, :profile_pic, :company_id
    )
  end
end
