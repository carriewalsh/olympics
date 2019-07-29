class Api::V1::OlympiansController < ApplicationController
  def index
    olympians = Olympian.list_olympians
    render json: olympians
  end
end
