class Api::V1::TeamsController < ApplicationController
  def index
    render json: Team.olympians_list
  end
end
