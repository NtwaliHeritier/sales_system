require_relative "product"
require_relative "charges"

class BasketItem
  attr_reader :product
  attr_accessor :quantity

  def initialize(product, quantity = 1)
    @product = product
    @quantity = quantity
  end

  def total_price
    sub_total = (@product.price * quantity)
    if product.code === "R01" && quantity > 1
      discount_charge = BuyOneGetSecondOnHalf.new(@product.price. * 0.5)
      discount_charge.apply(sub_total)
    else
      sub_total
    end
  end
end