class Merchant

  attr_accessor :total_sale, :discount_in_per

  def initialize(email, discount_in_per)
    @email = email
    @discount_in_per = discount_in_per
    @total_sale = 0
  end
end