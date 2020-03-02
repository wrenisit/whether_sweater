class ForecastFacade
  def initialize(loc, dest = loc)
    @location = loc
    @dest = dest || nil
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

  def find_forecast_future
    geo = GeoService.new
    geocoded = geo.find(@dest)
    longitude = geocoded["results"][0]["geometry"]["location"]["lng"]
    latitude = geocoded["results"][0]["geometry"]["location"]["lat"]
    geocode_obj = Geocode.new(latitude, longitude)
    darksky = DarkskyService.new
    forecast_hash = darksky.find_future(geocode_obj, future_time)
    forecast = Forecast.new(forecast_hash)
  end

  def future_time
    geo = GeoService.new
    geocoded = geo.find(@dest)
    longitude = geocoded["results"][0]["geometry"]["location"]["lng"]
    latitude = geocoded["results"][0]["geometry"]["location"]["lat"]
    geocode_obj = Geocode.new(latitude, longitude)
    geocode_directions = geo.directions(@location, @dest)
    @travel_time = geocode_directions["routes"][0]["legs"][0]["duration"]["text"]
    time = @travel_time.split(" ")
    Time.now.to_i + (time[0].to_i * 60 * 60) + (time[2].to_i * 60)       
  end
end
