class Account

  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize
    @balance = 0
    @dates = []
    @deposits = []
    @statement_end = ""
  end

  def deposit(amount, date)
    @deposits << amount
    @balance += amount
    @dates << date
    @date = date
  end

  def print_statement
    no_entries = @dates.length
    balance_on_date = @balance

    @dates.reverse.each_with_index { |date, index|
      last_deposit = @deposits[no_entries-index-1]

      @statement_end += "#{date} || #{last_deposit}.00 || || #{balance_on_date}.00\n"

      balance_on_date -= @deposits[no_entries-index-1]
    }

    puts STATEMENT_HEADER + @statement_end
  end

end
