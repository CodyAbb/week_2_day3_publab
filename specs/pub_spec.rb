require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class PubTest < Minitest::Test

  def setup
    @pub  = Pub.new("4042", 350)

    @drink1 = Drink.new("Beer", 2)
    @drink2 = Drink.new("Wine", 3)
    @drink3 = Drink.new("Gin", 4)
    @customer = Customer.new("Alex", 50)
    @customer2 = Customer.new("Katie", 1)

    @pub2 = Pub.new("Chanter", 400, [@drink1, @drink2, @drink3])

  end

  def test_get_pub_name
    assert_equal("4042", @pub.name)
  end

  def test_get_pub_wallet
    assert_equal(350, @pub.till)
  end

  def test_check_stock_level
    assert_equal(3, @pub2.check_stock_level)
  end

  def test_check_drink_in_stock
    assert_equal(true, @pub2.check_for_drink("Wine"))
  end

  def test_check_drink_not_in_stock
    assert_equal(false, @pub2.check_for_drink("Rum"))
  end

  def test_customer_can_afford_drink
    assert_equal(true, @customer.can_afford_drink(@drink1))
  end

  def test_customer_cannot_afford_drink
    assert_equal(false, @customer2.can_afford_drink(@drink2))
  end

  def test_check_drink_removed

    @pub2.sell_drink(@drink3)
    assert_equal(2, @pub2.check_stock_level)
  end

end
