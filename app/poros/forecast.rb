class Forecast
  attr_reader :id, :forecast
  def initialize(forecast_hash)
    @id = nil
    @forecast = forecast_hash
  end
end
