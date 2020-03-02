class MunchiesFacade
  def initialize(food, location)
    @food = food
    @location = location
  end

  def find_food
    restaurant = Restaurant.new(@food, @location)
  end
end
