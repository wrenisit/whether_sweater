class RoadTrip
  attr_reader :id, :origin, :destination, :forecast, :travel_time
  def initialize(origin, destination, forecast, travel_time)
    @id = "null"
    @origin = origin
    @destination = destination
    @forecast = forecast
    @travel_time = travel_time
  end
end
