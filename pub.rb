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

  def increase_till_cash(drink)
    @till += drink.price
  end

  def sell_drink(drink)
    @drinks.delete(drink)
  end

  def sell_drink_to_customer(drink, customer)
    new_drunk_level = (customer.drunkenness + drink.alcohol_level)
    if check_for_drink(drink.name) && customer.can_afford_drink(drink) && customer.age >= 18 && new_drunk_level <= 10
      sell_drink(drink)
      increase_till_cash(drink)
      customer.pay_for_drink(drink)
      customer.increase_drunkenness(drink)
    end
  end



end
