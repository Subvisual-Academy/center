class HobbiesController < ApplicationController
  # GET /answers
  def index
    @hobbies = Hobby.all

    render json: @hobbies
  end
end
