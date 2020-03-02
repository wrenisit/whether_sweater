class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast, :trip_duration, :restaurant
end
