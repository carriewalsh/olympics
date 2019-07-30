class Api::V1::EventMedalistsController < ApplicationController
  def index
    event = Event.find(params[:id])
    render json: event.medalists
  end
end
