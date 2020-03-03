class AntipodeFacade < ForecastFacade
  def initialize(loc)
    @location = loc
    @location_name = city_name
  end

  def make_data
    Antipode.new(condensed_forecast, @location, @location_name)
  end

  def antipode_coordinates
    coordinates_hash = AntipodeService.new.request_anti(geocode)
    coordinates = JSON.parse(coordinates_hash.body)["data"]["attributes"]
  end

  def city_name
    GeoService.new.find_city(antipode_coordinates)
  end

  def condensed_forecast
    DarkskyService.new.forecast_condensed(antipode_coordinates)
  end
end
