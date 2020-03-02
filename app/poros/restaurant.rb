class Restaurant
  def initialize(food, location)
    @food = food
    @location = location
  end

  def find_restaurant
    restaurant_hash = Faraday.get("https://api.yelp.com/v3/businesses/search?Bearer=#{ENV['YELP_KEY']}&location=#{@location}&term=restaurant,#{@food}")
    restaurant = JSON.parse(restaurant_hash.body)
  end
end
