class Merchant

  attr_accessor :total_sale, :discount_in_per

  def initialize(merchant_id, email, discount_in_per)
    @id = merchant_id
    @email = email
    @discount_in_per = discount_in_per
    @total_sale = 0
  end

  def display_total_discount()
    (total_sale * discount_in_per) / 100
  end
end