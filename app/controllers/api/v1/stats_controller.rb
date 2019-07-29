class Api::V1::StatsController < ApplicationController
  def show
    stats = Olympian.stats
    render json: stats
  end
end
