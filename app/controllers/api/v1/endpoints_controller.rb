class Api::V1::EndpointsController < ApplicationController
  def backgrounds
    location_param = params[:location]
    location = location_param.split(",")[0]
    conn = Faraday.new("https://api.unsplash.com")
    image = conn.get("/search/photos/?client_id=#{ENV['UNSPLASH_KEY']}&query=#{location}")
  end

  def index
    forecast = ForecastFacade.new(params[:location])
    render json: ForecastSerializer.new(forecast.find_forecast)
  end

  def munchies
    start = params[:start]
    end_location = params[:end]
    food = params[:food]
    google = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{end_location}&key=#{ENV['GEOCODE_KEY']}")
    directions_hash = JSON.parse(google.body)
    travel_time = directions_hash["routes"][0]["legs"][0]["duration"]["text"]
    end_location = params[:end]
    forecast = ForecastFacade.new(params[:end])
    render json: ForecastSerializer.new(forecast.find_forecast_future)
    binding.pry
  end
end
