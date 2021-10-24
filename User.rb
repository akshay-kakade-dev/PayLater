class User

  attr_accessor :total_spent, :id, :credit_limit

  def initialize(user_id, email, credit_limit)
    @id = user_id
    @email = email
    @credit_limit = credit_limit
    @total_spent = 0
    @paid_amount = 0
  end

  def transact(merchant, amount)
    if total_spent + amount > @credit_limit
      'rejected! (reason: credit limit)'
    else
      @total_spent = @total_spent + amount
      merchant.acquire_sell(amount)
      'success'
    end
  end

  def payback(amount)
    @paid_amount = @paid_amount + amount
  end

  def get_due
    @total_spent - @paid_amount
  end
end