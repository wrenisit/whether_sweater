class Restaurant

  def find_restaurant(food, location)
    restaurant_hash = Faraday.get("https://api.yelp.com/v3/businesses/search?Bearer=#{ENV['YELP_KEY']}&location=#{location}&term=restaurant,#{food}")
    restaurant = JSON.parse(restaurant_hash.body)
  end
end
