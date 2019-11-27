require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../customer')

class CustomerTest < Minitest::Test

  def setup
    @customer = Customer.new("Alex", 50)
  end


  def test_get_customer_name
    assert_equal("Alex", @customer.name)
  end

  def test_get_wallet_amount
    assert_equal(50, @customer.wallet)
  end

  
end
