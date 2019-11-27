class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def can_afford_drink(drink)
    if @wallet >= drink.price
        return true
    end
    return false
  end

  def pay_for_drink(drink)
    @wallet -= drink.price
  end

end
