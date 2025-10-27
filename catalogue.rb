require_relative "product"

class Catalogue
  attr_reader :products
  
  def initialize
    @products = [
      Product.new("Red Widget", "R01", 32.95),
      Product.new("Green Widget", "G01", 24.95),
      Product.new("Blue Widget", "B01", 7.95)
    ]
  end

  def find_product_by_code(code)
    @products.find {|product| product.code === code}
  end
end