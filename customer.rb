class Customer

  attr_reader :name, :wallet, :age
  attr_accessor :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def can_afford_item(item)
    if @wallet >= item.price
      return true
    end
    return false
  end

  def pay_for_drink(drink)
    @wallet -= drink.price

  end

  def pay_for_food(food)
    @wallet -= food.price
  end

  def increase_drunkenness(drink)
    @drunkenness += drink.alcohol_level
  end

  def decrease_drunkeness(food)
    @drunkenness -= food.rejuvenation_level
  end

end
