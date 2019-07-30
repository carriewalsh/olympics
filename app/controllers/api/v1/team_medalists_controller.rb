class Api::V1::TeamMedalistsController < ApplicationController
  def index
    team = Team.find(params[:id])
    render json: team.medalists
  end
end
