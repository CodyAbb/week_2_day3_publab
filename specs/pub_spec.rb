require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../customer')
require_relative('../drink')
require_relative('../food')

class PubTest < Minitest::Test

  def setup
    @pub  = Pub.new("4042", 350)

    @drink1 = Drink.new("Beer", 2, 1)
    @drink2 = Drink.new("Wine", 3, 2)
    @drink3 = Drink.new("Gin", 4, 3)
    @drink4 = Drink.new("Tequila", 5, 11)
    @customer = Customer.new("Alex", 50, 30)
    @customer2 = Customer.new("Katie", 1, 16)
    @customer3 = Customer.new("Harrison", 10, 15)
    @food = Food.new("chips", 3, 2)
    @food1 = Food.new("pizza", 4, 3)
    @food2 = Food.new("kebab", 5, 10)

    @pub2 = Pub.new("Chanter", 400, [@drink1, @drink2, @drink3])
    @pub3 = Pub.new("Caley PictureHouse", 200, [@drink4])
    @pub4 = Pub.new("Shandwicks", 500, [@drink1, @drink2, @drink3], [@food, @food1, @food2])

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
    assert_equal(true, @customer.can_afford_item(@drink1))
  end

  def test_customer_cannot_afford_drink
    assert_equal(false, @customer2.can_afford_item(@drink2))
  end

  def test_check_drink_removed
    @pub2.sell_drink(@drink3)
    assert_equal(2, @pub2.check_stock_level)
  end

  def test_check_till_increase
    @pub2.increase_till_cash(@drink3)
    assert_equal(404, @pub2.till)
  end

  def test_decreases_customer_wallet_by_drink_price
    @customer.pay_for_drink(@drink1)
    assert_equal(48, @customer.wallet)
  end

  def test_sell_drink_to_customer_if_old_enough
    @pub2.sell_drink_to_customer(@drink2, @customer)
    assert_equal(2, @pub2.check_stock_level)
    assert_equal(403, @pub2.till)
    assert_equal(47, @customer.wallet)
  end

  def test_do_not_sell_drink_to_customer_if_not_old_enough
    @pub2.sell_drink_to_customer(@drink2, @customer3)
    assert_equal(3, @pub2.check_stock_level)
    assert_equal(400, @pub2.till)
    assert_equal(10, @customer3.wallet)
    assert_equal(0, @customer3.drunkenness)
  end

  def test_do_not_sell_to_customer_with_over_10_drunkenness

    @pub3.sell_drink_to_customer(@drink4, @customer)

    assert_equal(1, @pub3.check_stock_level)
    assert_equal(200, @pub3.till)
    assert_equal(50, @customer.wallet)
  end

  def test_sell_drink_to_customer_if_under_10_drunkenness
    @pub2.sell_drink_to_customer(@drink1, @customer)
    @pub2.sell_drink_to_customer(@drink2, @customer)
    @pub2.sell_drink_to_customer(@drink3, @customer)

    assert_equal(0, @pub2.check_stock_level)
    assert_equal(409, @pub2.till)
    assert_equal(41, @customer.wallet)
    assert_equal(6, @customer.drunkenness)
  end

  def test_sell_food_to_customer_who_can_afford
    @pub4.sell_food_to_customer(@food1, @customer)
    assert_equal(504, @pub4.till)
    assert_equal(46, @customer.wallet)
    assert_equal(2, @pub4.check_food_stock_level)
  end

  def test_having_food_reduces_drunkenness
    @pub4.sell_drink_to_customer(@drink1, @customer)
    @pub4.sell_drink_to_customer(@drink2, @customer)
    @pub4.sell_drink_to_customer(@drink3, @customer)
    @pub4.sell_food_to_customer(@food1, @customer)

    assert_equal(3, @customer.drunkenness)
    assert_equal(513, @pub4.till)
    assert_equal(37, @customer.wallet)
    assert_equal(2, @pub4.check_food_stock_level)
    assert_equal(0, @pub4.check_stock_level)
  end

end
