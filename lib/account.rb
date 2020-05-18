class Account

  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize
    @dates = []
    @deposits = []
    @statement_end = ""
  end

  def deposit(amount, date)
    @deposits << amount
    @dates << date
    @date = date
  end

  def print_statement
    create_statement
    puts STATEMENT_HEADER + @statement_end
  end

  private

  def create_statement
    total_entries = @dates.length
    balance_on_date = @deposits.sum

    @dates.reverse.each_with_index { |date, index|
      last_deposit = @deposits[total_entries-index-1]
      @statement_end += "#{date} || #{last_deposit}.00 || || #{balance_on_date}.00\n"
      balance_on_date -= @deposits[total_entries-index-1]
    }
  end

end
