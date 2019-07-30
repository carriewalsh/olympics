class Api::V1::PopularityController < ApplicationController
  def index
    popularity = Event.popularity
    render json: popularity
  end
end
