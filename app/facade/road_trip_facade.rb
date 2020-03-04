class RoadTripFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def make_data( )
    RoadTrip.new(@origin, @destiination, travel_time, condensed_forecast)
  end
end
