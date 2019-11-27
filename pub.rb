class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks = [])
    @name = name
    @till = till
    @drinks = drinks
  end


  def check_stock_level
    return @drinks.length
  end

  def check_for_drink(search_drink)
    for drink in @drinks
      if drink.name == search_drink
        return true
      end
    end
    return false
  end

  def sell_drink(drink)
    @drinks.delete(drink)
  end

end
