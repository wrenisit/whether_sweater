class AntipodeFacade < ForecastFacade
  def initialize(loc)
    @location = loc
    @location_name = city_name
  end

  def antipode_coordinates
    coordinates_hash = AntipodeService.new.request_anti
    coordinates = JSON.parse(coordinates_hash.body)["data"]["attributes"]
  end

  def city_name
    GeoService.new.find_city(antipode_coordinates)
  end

  def condensed_forecast
    darksky = DarkskyService.new
    forecast_hash = darksky.find(geocode)
    forecast = Hash.new
    forecast["summary"] = forecast_hash["currently"]["summary"]
    forecast["current_temperature"] = forecast_hash["currently"]["temperature"]
    Antipode.new(forecast, @location, @location_name)
  end
end
