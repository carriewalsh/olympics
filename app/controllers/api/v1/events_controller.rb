class Api::V1::EventsController < ApplicationController
  def index
    render json: Sport.list_all_with_events
  end

end
