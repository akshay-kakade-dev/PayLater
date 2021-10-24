class Merchant

  attr_accessor :total_sale, :discount_in_per, :id

  def initialize(merchant_id, email, discount_in_per)
    @id = merchant_id
    @email = email
    @discount_in_per = discount_in_per
    @total_sale = 0
  end

  def display_total_discount()
    (total_sale * discount_in_per) / 100.to_f
  end

  def acquire_sell(amount)
    self.total_sale = total_sale + amount
  end
end