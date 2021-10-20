module ReportOperations
  def report_discount(input_data)
    merchant_id = input_data[0][1].to_i
    merchant = ObjectSpace.each_object(Merchant).to_a[merchant_id]
    merchant.display_total_discount
  end

  def report_dues(input_data)
    user_id = input_data[0][1].to_i
    user = ObjectSpace.each_object(User).to_a[user_id]
    use.total_spent
  end

  def report_users_at_credit_limit()
    # all users at credit limit
    Report.report_users_at_credit_limit
  end

  def report_total_dues()
    # all total dues from users
    Report.report_total_dues()
  end
end