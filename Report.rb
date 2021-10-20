require './user'

class Report
  def self.report_users_at_credit_limit
    ObjectSpace.each_object(User).select { |user| (user.credit_limit - user.total_spent) == 0 }
  end

  def self.report_total_dues
    total_dues = 0
    
    ObjectSpace.each_object(User).each do |user|
      total_dues = total_dues + user.total_spent
    end

    total_dues
  end  
end