class RoadTripFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def make_data(travel_time, condensed_forecast_future)
    RoadTrip.new(@origin, @destiination, travel_time, condensed_forecast)
  end

  def travel_time
    
  end

  def condensed_forecast_future

  end
end
