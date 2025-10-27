require_relative "product"

class Catalogue
  attr_reader :products
  
  def initialize
    @products = [
      Product.new("R01", "Red Widget", 32.95),
      Product.new("G01", "Green Widget", 24.95),
      Product.new("B01", "Blue Widget", 7.95)
    ]
  end
end