class Api::V1::PercentageWinsController < ApplicationController
  def index
    percentage_wins = Team.list_percentages
    render json: percentage_wins
  end
end
