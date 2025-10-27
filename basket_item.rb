require_relative "product"

class BasketItem
  attr_reader :product
  attr_accessor :quantity

  def initialize(product, quantity = 1)
    @product = product
    @quantity = quantity
  end

  def total_price
    (@product.price * quantity).to_f
  end
end