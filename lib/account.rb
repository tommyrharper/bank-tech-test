class Account

  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize
    @dates = []
    @deposits = []
    @statement_end = ""
  end

  def deposit(amount, date)
    @deposits.unshift(amount)
    @dates.unshift(date)
  end

  def withdraw(amount, date)
    @deposits.unshift(-amount)
    @dates.unshift(date)
  end

  def print_statement
    create_statement
    puts STATEMENT_HEADER + @statement_end
  end

  private

  def create_statement
    balance_on_date = @deposits.sum

    @dates.each_with_index { |date, index|
      if @deposits[index] > 0
        @statement_end += "#{date} || #{'%.2f' % @deposits[index]} || || #{'%.2f' % balance_on_date}\n"
      else
        @statement_end += "#{date} || || #{-@deposits[index]}.00 || #{balance_on_date}.00\n"
      end
      balance_on_date -= @deposits[index]
    }
  end

end
