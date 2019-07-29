class StatsController < ApplicationController
  def show
    stats = Olympian.stats
    render json: stats
  end
end
