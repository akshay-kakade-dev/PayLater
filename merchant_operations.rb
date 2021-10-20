module MerchantOperations
  def new_merchant(input_data)
    merchant_id = input_data[0]
    email = input_data[1]
    discount_in_per = input_data[2]
    Merchant.new(merchant_id, email, discount_in_per)
  end

  def update_merchant(input_data)
    merchant_id = input_data[0][1].last.to_i
    discount_in_per = input_data[1].to_i
    merchant = ObjectSpace.each_object(Merchant).to_a[merchant_id]
    merchant.discount_in_per = discount_in_per
  end
end