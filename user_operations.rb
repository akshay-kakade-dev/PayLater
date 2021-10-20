require 'byebug'
module UserOperations
  def new_user(input_data)
    user_id = input_data[0]
    email = input_data[1]
    credit_limit = input_data[2]
    User.new(user_id, email, credit_limit)
  end

  def new_txn(input_data)
    user_id = input_data[0][1].to_i
    merchant_id = input_data[1][1].to_i
    amount = input_data[2].to_i
    user = ObjectSpace.each_object(User).to_a[user_id]
    merchant = ObjectSpace.each_object(Merchant).to_a[merchant_id]
    user.transact(merchant, amount)
  end

  def payback(input_data)
    user_id = input_data[0][1].last.to_i
    amount = input_data[1].to_i
    user = ObjectSpace.each_object(User).to_a[user_id]
    user.payback(amount)
  end
end