class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age] == "youngest"
      age = Olympian.order(age: :asc).first.age
      olympians = Olympian.where(age: age).list_olympians
    elsif params[:age] == "oldest"
      age = Olympian.order(age: :desc).first.age
      olympians = Olympian.where(age: age).list_olympians
    else
      olympians = Olympian.list_olympians
    end
    render json: olympians
  end
end
