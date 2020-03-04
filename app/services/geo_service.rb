class GeoService
  def find(location)
    geocode_hash = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{ENV['GEOCODE_KEY']}")
    geocode = JSON.parse(geocode_hash.body)
  end

  def directions(start, end_location)
    google = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{start}&destination=#{end_location}&key=#{ENV['GEOCODE_KEY']}")
    directions_hash = JSON.parse(google.body)
  end
end
