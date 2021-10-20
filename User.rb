class User

  attr_accessor :total_spent

  def initialize(user_id, email, credit_limit)
    @id = user_id
    @email = email
    @credit_limit = credit_limit
    @total_spent = 0
  end

  def transact(merchant, amount)
    
  end

  def payback(amount)
  end
end