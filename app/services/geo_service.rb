class GeoService
  def find(location)
    geocode_hash = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{ENV['GEOCODE_KEY']}")
    geocode = JSON.parse(geocode_hash.body)
  end

  def find_city(hash)
    geocode_hash = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{hash["lat"]},#{hash["long"]}&key=#{ENV['GEOCODE_KEY']}")
    JSON.parse(geocode_hash.body)["results"][0]["address_components"][2]["long_name"]
  end
end
