class GeoService
  def find(location)
    geocode_hash = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{ENV['GEOCODE_KEY']}")
    geocode = JSON.parse(geocode_hash.body)
  end
end
