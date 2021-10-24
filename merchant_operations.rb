module MerchantOperations
  def new_merchant(input_data)
    merchant_id = input_data[0]
    email = input_data[1]
    discount_in_per = input_data[2].to_i
    merchants.push(Merchant.new(merchant_id, email, discount_in_per))
  end

  def update_merchant(input_data)
    merchant_id = input_data[0]
    discount_in_per = input_data[1].to_i
    merchant = find_merchant(merchant_id)

    return "merchant is not present for #{merchant_id}" if merchant.nil?

    merchant.discount_in_per = discount_in_per
  end

  def find_merchant(merchant_id)
    merchants.find { |merchant| merchant.id == merchant_id }
  end
end