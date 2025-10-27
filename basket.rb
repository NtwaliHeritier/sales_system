require_relative "catalogue"
require_relative "basket_item"

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
end

basket = Basket.new
basket.add_product("R01")
basket.add_product("R01", 2)

puts basket.items[0].quantity