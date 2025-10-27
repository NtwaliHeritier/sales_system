require_relative "catalogue"
require_relative "basket_item"
require_relative "charges"
require_relative "normalize"

class Basket
  attr_reader :items, :catalogue
  @@catalogue = Catalogue.new()

  def initialize
    @items = []
  end

  def add_product(code, quantity = 1)
    product = @@catalogue.find_product_by_code(code)
    raise "Unknown product code: #{code}" unless product

    existing_item = @items.find {|item| item.product.code === code}
    if existing_item
      existing_item.quantity += quantity
    else
      @items.push(BasketItem.new(product, quantity))
    end
  end

  def total_price
    sub_total_price = Normalize.total(@items.sum(&:total_price))

    if sub_total_price < 50
      transport_charges = TransportCharges.new(4.95)
      transport_charges.apply(sub_total_price)
    elsif sub_total_price >= 50 && sub_total_price < 90
      transport_charges = TransportCharges.new(2.95)
      transport_charges.apply(sub_total_price)
    else
      sub_total_price
    end
  end
end

# Testing scenarios

basket1 = Basket.new
basket1.add_product("B01")
basket1.add_product("G01")
puts basket1.total_price

basket2 = Basket.new
basket2.add_product("R01")
basket2.add_product("R01")
puts basket2.total_price

basket3 = Basket.new
basket3.add_product("R01")
basket3.add_product("G01")
puts basket3.total_price

basket4 = Basket.new
basket4.add_product("B01")
basket4.add_product("B01")
basket4.add_product("R01")
basket4.add_product("R01")
basket4.add_product("R01")
puts basket4.total_price