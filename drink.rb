class Drink

  attr_reader :name, :price, :alcohol_level

  def initialize(name, price, alochol_level)
    @name = name
    @price = price
    @alcohol_level = alochol_level
  end

end
