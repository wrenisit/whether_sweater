class RoadTripFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def make_data
    RoadTrip.new(@origin, @destiination, travel_time, condensed_forecast)
  end

  def travel_time
    geo = GeoService.new.directions(@start, @end_location)
    geo["routes"][0]["legs"][0]["duration"]["text"]
  end

  def condensed_forecast_future
    DarkskyService.new.forecast_condensed(@destination, arrival_time)
  end

  def arrival_time
    # geocoded = GeoService.new.find(@destination)
    # longitude = geocoded["results"][0]["geometry"]["location"]["lng"]
    # latitude = geocoded["results"][0]["geometry"]["location"]["lat"]
    # geocode_obj = Geocode.new(latitude, longitude)
    geocode_directions = geo.directions(@start, @end_location)
    @travel_time = geocode_directions["routes"][0]["legs"][0]["duration"]["text"]
    time = @travel_time.split(" ")
    Time.now.to_i + (time[0].to_i * 60 * 60) + (time[2].to_i * 60)
  end
end
