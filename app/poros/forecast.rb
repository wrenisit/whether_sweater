class Forecast
  attr_reader :id
  def initialize(forecast_hash, location)
    @id = nil
    @currently = forecast_hash[:currently]
    @hourly = forecast_hash[:hourly]
    @daily = forecast_hash[:daily]
    @timezone = forecast_hash[:timezone]
    @location = location
  end
end
