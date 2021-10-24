module ReportOperations
  def report_discount(input_data)
    merchant_id = input_data[0]
    merchant = find_merchant(merchant_id)
    merchant.display_total_discount
  end

  def report_dues(input_data)
    user_id = input_data[0]
    user = find_user(user_id)
    return "user is not present for #{user_id}" if user.nil?
    user.get_due
  end

  def report_users_at_credit_limit()
    users_at_credit_limit = users.select { |user| user.get_due == user.credit_limit }
    users_at_credit_limit.map { |user| user.id }
  end

  def report_total_dues()
    # all total dues from users
    result = ''
    users.each do |user|
      if user.get_due > 0
        result = result + "#{user.id}: #{user.get_due} "
      end
    end
    result
  end
end