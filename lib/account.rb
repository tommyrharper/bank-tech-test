class Account
  def initialize
    @balance = 0
  end

  def deposit(amount, date)
    @balance = amount
    @date = date
  end

  def print_statement
    print "date || credit || debit || balance\n#{@date} || #{@balance}.00 || || #{@balance}.00"
  end

end
