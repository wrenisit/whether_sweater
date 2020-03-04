class RoadTripFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def make_data(travel_time, condensed_forecast_future)
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

  end
end
