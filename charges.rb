require "bigdecimal/util"
require_relative "normalize"

class Charges
  def apply(subtotal)
    raise NotImplementedError
  end
end

class TransportCharges < Charges
  def initialize(charges)
    @charges = charges
  end

  def apply(sub_total)
    Normalize.total(sub_total.to_d + @charges.to_d)
  end
end

class BuyOneGetSecondOnHalf < Charges
  def initialize(discount_charge)
    @discount_charge = discount_charge
  end

  def apply(subtotal)
    Normalize.total(subtotal.to_d - @discount_charge.to_d)
  end
end