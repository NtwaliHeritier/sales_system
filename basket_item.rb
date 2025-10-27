require_relative "product"

class BasketItem
  attr_reader :product, :quantity

  def initialize(product, quantity = 1)
    @product = product
    @quantity = quantity
  end
end