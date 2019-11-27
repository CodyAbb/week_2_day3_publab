require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class FoodTest < Minitest::Test


  def setup
    @food = Food.new("chips", 3, 2)
    @food1 = Food.new("pizza", 4, 3)
    @food2 = Food.new("kebab", 5, 10)
  end

  def test_get_food_name
    assert_equal("chips", @food.name)
  end

  def test_get_food_price
    assert_equal(3, @food.price)
  end

  def test_get_food_rejuvenation
    assert_equal(2, @food.rejuvenation_level)
  end
end
