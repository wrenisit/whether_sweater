class AntipodeFacade < ForecastFacade
  def initialize(loc)
    @location = loc
  end

  def antipode_coordinates
    coordinates_hash = request_anti
    coordinates = JSON.parse(coordinates_hash.body)["data"]["attributes"]
  end

  def antipode_city
    city_hash = GeoService.new.find_city(antipode_coordinates)
  end
  private

  def conn
    Faraday.new('http://amypode.herokuapp.com/api/v1') do |f|
      f.headers["api_key"] = ENV['AMYPODE_KEY']
    end
  end

  def request_anti
    location_hash = geocode
    conn.get("antipodes?lat=#{location_hash[:lat]}&long=#{location_hash[:lon]}")
  end
end
