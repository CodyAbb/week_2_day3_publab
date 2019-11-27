require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../customer')
require_relative('../drink')

class CustomerTest < Minitest::Test

  def setup
    @customer = Customer.new("Alex", 50, 30)
    @drink = Drink.new("Beer", 2, 1)
  end


  def test_get_customer_name
    assert_equal("Alex", @customer.name)
  end

  def test_get_wallet_amount
    assert_equal(50, @customer.wallet)
  end

  def test_check_can_get_age
    assert_equal(30,  @customer.age)
  end

  def test_can_check_drunkenness_level_starts_at_zero
    assert_equal(0, @customer.drunkenness)
  end

  def test_can_increment_drunkenness_when_drink_is_bought
    @customer.pay_for_drink(@drink)
    assert_equal(1, @customer.drunkenness)
  end

end
