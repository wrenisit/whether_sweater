class Antipode
  attr_reader :id, :forecast, :location_name, :search_location
  def initialize(forecast, location, location_name)
    @id = "null"
    @forecast = forecast
    @location_name = location_name
    @search_location = location
  end
end
