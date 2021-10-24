require 'byebug'
module UserOperations
  def new_user(input_data)
    user_id = input_data[0]
    email = input_data[1]
    credit_limit = input_data[2].to_i
    users.push(User.new(user_id, email, credit_limit))
  end

  def new_txn(input_data)
    user_id = input_data[0]
    merchant_id = input_data[1]
    amount = input_data[2].to_i

    user = find_user(user_id)
    merchant = find_merchant(merchant_id)

    return "user is not present for #{user_id}" if user.nil?
    return "merchant is not present for #{merchant_id}" if merchant.nil?

    user.transact(merchant, amount)
  end

  def payback(input_data)
    user_id = input_data[0]
    amount = input_data[1].to_i

    user = find_user(user_id)
    return "user is not present for #{user_id}" if user.nil?

    user.payback(amount)
  end

  def find_user(user_id)
    users.find { |user| user.id == user_id }
  end
end