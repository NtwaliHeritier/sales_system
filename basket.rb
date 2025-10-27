require_relative "catalogue"
require_relative "basket_item"
require_relative "charges"

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
    sub_total_price = @items.sum(&:total_price)

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

basket = Basket.new
basket.add_product("R01")
basket.add_product("R01", 2)
basket.add_product("G01", 2)

puts basket.items[0].quantity
puts basket.total_price