class Pub

  attr_reader :name, :till

  def initialize(name, till, drinks = [], food = [])
    @name = name
    @till = till
    @drinks = drinks
    @food = food
  end


  def check_stock_level
    return @drinks.length
  end

  def check_food_stock_level
    return @food.length
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

  def check_for_food(search_food)
    for food in @food
      if food.name == search_food
        return true
      end
    end
    return false
  end

  def sell_food(food)
    @food.delete(food)
  end

  def sell_drink_to_customer(drink, customer)
    new_drunk_level = (customer.drunkenness + drink.alcohol_level)
    if check_for_drink(drink.name) && customer.can_afford_item(drink) && customer.age >= 18 && new_drunk_level <= 10
      sell_drink(drink)
      increase_till_cash(drink)
      customer.pay_for_drink(drink)
      customer.increase_drunkenness(drink)
    end
  end

  def sell_food_to_customer(food, customer)
    if check_for_food(food.name) && customer.can_afford_item(food)
      sell_food(food)
      increase_till_cash(food)
      customer.pay_for_food(food)
      customer.decrease_drunkeness(food)
    end

  end



end
