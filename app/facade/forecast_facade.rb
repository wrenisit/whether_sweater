class ForecastFacade
  def initialize(loc)
    @location = loc
  end

  def geocode
    geo = GeoService.new
    geocode = geo.find(@location)
    longitude = geocode["results"][0]["geometry"]["location"]["lng"]
    latitude = geocode["results"][0]["geometry"]["location"]["lat"]
    Geocode.new(latitude, longitude)
  end

  def find_forecast
    darksky = DarkskyService.new
    forecast_hash = darksky.find(geocode)
    Forecast.new(forecast_hash)
  end
end
