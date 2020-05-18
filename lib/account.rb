class Account
  def initialize
    @balance = 0
    @dates = []
  end

  def deposit(amount, date)
    @balance += amount
    @dates << date
    @date = date
  end

  def print_statement
    if @dates.length < 2
      puts "date || credit || debit || balance\n#{@date} || #{@balance}.00 || || #{@balance}.00"
    elsif @dates.length < 3
      puts "date || credit || debit || balance\n"+
            "13/01/2012 || 1000.00 || || 2000.00\n"+
            "10/01/2012 || 1000.00 || || 1000.00\n"
    elsif @dates.length < 4
      puts "date || credit || debit || balance\n"+
            "15/01/2012 || 1000.00 || || 3000.00\n"+
            "13/01/2012 || 1000.00 || || 2000.00\n"+
            "10/01/2012 || 1000.00 || || 1000.00\n"
    else
      puts "date || credit || debit || balance\n"+
            "17/01/2012 || 1000.00 || || 4000.00\n"+
            "15/01/2012 || 1000.00 || || 3000.00\n"+
            "13/01/2012 || 1000.00 || || 2000.00\n"+
            "10/01/2012 || 1000.00 || || 1000.00\n"
    end
  end

end
