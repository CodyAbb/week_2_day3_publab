require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
require_relative('../pub')

class PubTest < Minitest::Test

  def setup
    @pub  = Pub.new("4042", 350)
  end

  def test_get_pub_name
    assert_equal("4042", @pub.name)
  end

  def test_get_pub_wallet
    assert_equal(350, @pub.till)
  end

end
