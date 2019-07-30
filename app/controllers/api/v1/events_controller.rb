class Api::V1::EventsController < ApplicationController
  def index
    render json: Sport.list_all_with_events
  end

  def show
    sport = Sport.find_by(id: params[:id])
    render json: sport.list_sport_events
  end

end
