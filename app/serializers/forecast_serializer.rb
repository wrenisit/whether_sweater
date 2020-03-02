class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast
end
