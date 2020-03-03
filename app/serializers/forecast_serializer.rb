class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :currently, :hourly, :daily, :timezone, :location
end
