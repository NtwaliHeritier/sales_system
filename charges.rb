class Charges
  def apply(subtotal)
    raise NotImplementedError
  end
end

class TransportCharges < Charges
  def initialize(charges)
    @charges = charges
  end

  def apply(subtotal)
    (subtotal.to_d + @charges.to_d).to_f
  end
end