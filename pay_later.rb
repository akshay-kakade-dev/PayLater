require './user_operations'
require './merchant_operations'
require './report_operations'
require './user'
require './merchant'

class PayLater
  include UserOperations
  include MerchantOperations
  include ReportOperations

  attr_accessor :users, :merchants

  OPTIONS_LIST = [
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

  def initialize()
    @users = []
    @merchants = []
  end

  def list_oprions
    OPTIONS_LIST.each_with_index do |item, index|
      p "#{index + 1}. #{item}"
    end
  end

  def accept_operation_choice
    p "Enter choice_no for operation"
    operation_no = accept_input()
    operation_no.to_i - 1
  end

  def trigger_operation(operation_no)
    result =  case operation_no
              when 0
                puts "i/p format: u1 u1@email.in 1000"
                new_user(accept_and_format_input)
              when 1
                puts "i/p format: m1 m1@merchants.com 0.5"
                new_merchant(accept_and_format_input)
              when 2
                puts "i/p format: u2 m1 500"
                new_txn(accept_and_format_input)
              when 3
                puts "i/p format: m1 1"
                update_merchant(accept_and_format_input)
              when 4
                puts "i/p format: u1 300"
                payback(accept_and_format_input)
              when 5
                puts "i/p format: m1"
                report_discount(accept_and_format_input)
              when 6
                puts "i/p format: u1"
                report_dues(accept_and_format_input)
              when 7
                report_users_at_credit_limit()
              when 8
                report_total_dues()
              when 9
                stop()
              else
                "wrong input"
              end
    puts "---------- #{result}"
  end

  def accept_and_format_input
    input = accept_input
    inputs = input.split(' ')
  end

  def accept_input
    gets.chomp
  end
end

service = PayLater.new
while true
  service.list_oprions
  choice = service.accept_operation_choice
  break if choice == 9
  service.trigger_operation(choice)
end
