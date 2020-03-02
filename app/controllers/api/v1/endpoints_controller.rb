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
end
