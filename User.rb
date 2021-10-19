class User

  attr_accessor :total_spent

  def initialize(email, credit_limit)
    @email = email
    @credit_limit = credit_limit
    @total_spent = 0
  end
end