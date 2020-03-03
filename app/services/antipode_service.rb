class AntipodeService
  def conn
    Faraday.new('http://amypode.herokuapp.com/api/v1') do |f|
      f.headers["api_key"] = ENV['AMYPODE_KEY']
    end
  end

  def request_anti(geocode)
    location_hash = geocode
    conn.get("antipodes?lat=#{location_hash[:lat]}&long=#{location_hash[:lon]}")
  end
end
