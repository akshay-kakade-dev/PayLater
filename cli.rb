require './user_operations'
require './merchant_operations'
require './report_operations'
require './user'
require './merchant'
require './report'

class CLI
  include UserOperations
  include MerchantOperations
  include ReportOperations

  @@options_list = [
    'new_user',
    'new_merchant',
    'new_txn',
    'update_merchant',
    'payback',
    'report_discount',
    'report_dues',
    'report_users_at_credit_limit',
    'report_total_dues',
    'stop'
  ]

  def list_oprions
    @@options_list.each_with_index do |item, index|
      p "#{index + 1}. #{item}"
    end
  end

  def accept_operation_choice
    p "Enter choice_no for operation"
    operation_no = accept_input()
    operation_no.to_i - 1
  end

  def trigger_operation(operation_no)
    case operation_no
    when 0
      new_user(accept_and_format_input)
    when 1
      new_merchant(accept_and_format_input)
    when 2
      new_txn(accept_and_format_input)
    when 3
      update_merchant(accept_and_format_input)
    when 4
      payback(accept_and_format_input)
    when 5
      report_discount(accept_and_format_input)
    when 6
      report_dues(accept_and_format_input)
    when 7
      report_users_at_credit_limit()
    when 8
      report_total_dues()
    when 9
      stop()
    else
      puts "wrong input"
    end
  end

  def accept_and_format_input
    input = accept_input
    inputs = input.split(' ')
  end

  def accept_input
    gets.chomp
  end
end

cli = CLI.new

while true
  cli.list_oprions
  choice = cli.accept_operation_choice
  break if choice == 9
  cli.trigger_operation(choice)
end
