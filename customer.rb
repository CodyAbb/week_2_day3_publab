class Customer

  attr_reader :name, :wallet, :age
  attr_accessor :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
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

  def increase_drunkenness(drink)
    @drunkenness += drink.alcohol_level
  end

end
