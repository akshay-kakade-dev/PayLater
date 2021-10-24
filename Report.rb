require './user'

class Report
  def self.report_users_at_credit_limit
    result = ''
    users = ObjectSpace.each_object(User).select { |user| (user.credit_limit - user.total_spent) == 0 }
    users.each { |user| result + user.id + ', ' }
    result
  end

  def self.report_total_dues
    result = ''
    
    ObjectSpace.each_object(User).each do |user|
      result = result + "#{user.id}: #{user.get_due} "
    end

    result
  end  
end