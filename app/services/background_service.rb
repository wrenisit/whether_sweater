class BackgroundService
  def generate_image(location_param)
    location = location_param.split(",")[0]
    image_hash = request("/search/photos/?client_id=#{ENV['UNSPLASH_KEY']}&query=#{location}")
    image = JSON.parse(image_hash.body)["results"].first["urls"]["full"]
  end

  def conn
    Faraday.new("https://api.unsplash.com")
  end

  def request(query)
    conn.get(query)
  end
end
