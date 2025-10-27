module Normalize
  def self.total(sub_total)
    sub_total.floor(2).to_f
  end
end