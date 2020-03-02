class Restaurant

  def find_restaurant(food, location)
    conn = Faraday.new('https://api.yelp.com/v3/businesses/search?') do |f|
      f.headers ("authorization": "Bearer=#{ENV['YELP_KEY']}")
    end
    restaurant_hash = conn.get("&location=#{location}&term=restaurant,#{food}")
    restaurant = JSON.parse(restaurant_hash.body)
  end
end
