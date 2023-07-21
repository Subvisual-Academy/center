class WeeklyActivitiesController < ApplicationController
  before_action :authorize_request
  before_action :set_weekly_activity, only: %i[show update destroy]

  # GET /activities
  def index
    @activities = WeeklyActivity.all

    render json: @activities
  end

  # GET /activities/1
  def show
    render json: @activity
  end

  # POST /activities
  def create
    @activity = WeeklyActivity.new(activity_params)

    if @activity.save
      render json: @activity, status: :created, location: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /activities/1
  def update
    if @activity.update(activity_params)
      render json: @activity
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /activities/1
  def destroy
    @activity.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weekly_activity
    @activity = WeeklyActivity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.permit(:user_1, :user_2)
  end
end
