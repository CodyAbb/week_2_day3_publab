require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../drink')

class DrinkTest < Minitest::Test

  def setup

    @drink = Drink.new("Beer", 2)

  end

  def test_get_drink_name
    assert_equal("Beer", @drink.name)
  end

  def test_get_drink_price
      assert_equal(2, @drink.price)
  end


end
