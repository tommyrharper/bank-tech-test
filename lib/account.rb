class Account

  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize
    @balance = 0
    @dates = []
    @deposits = []
  end

  def deposit(amount, date)
    @deposits << amount
    @balance += amount
    @dates << date
    @date = date
  end

  def print_statement
    if @dates.length < 2
      puts STATEMENT_HEADER +
      "#{@date} || #{@balance}.00 || || #{@balance}.00"
    elsif @dates.length < 3
      puts STATEMENT_HEADER +
            "#{@dates.pop} || #{@deposits[1]}.00 || || #{@balance}.00\n"+
            "#{@dates.pop} || #{@deposits[0]}.00 || || #{@balance-@deposits.pop}.00\n"
    elsif @dates.length < 4
      puts STATEMENT_HEADER +
            "#{@dates.pop} || #{@deposits[2]}.00 || || #{@balance}.00\n"+
            "#{@dates.pop} || #{@deposits[1]}.00 || || #{@balance-@deposits.pop}.00\n"+
            "#{@dates.pop} || #{@deposits[0]}.00 || || #{@balance-@deposits.pop-@deposits.pop}.00\n"
    else
      puts STATEMENT_HEADER +
            "#{@dates.pop} || #{@deposits[3]}.00 || || #{@balance}.00\n"+
            "#{@dates.pop} || #{@deposits[2]}.00 || || #{@balance-@deposits.pop}.00\n"+
            "#{@dates.pop} || #{@deposits[1]}.00 || || #{@balance-@deposits.pop-@deposits.pop}.00\n"+
            "#{@dates.pop} || #{@deposits[0]}.00 || || #{@balance-(@deposits.pop*3)}.00\n"
    end
  end

end
