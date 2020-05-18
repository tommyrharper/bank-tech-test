class Account

  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize
    @dates = []
    @deposits = []
    @statement_end = ""
  end

  # def deposit(amount, date)
  def deposit(amount)
    time = Time.now
    time_refactored = time.strftime('%d/%m/%Y')
    date = 
    @deposits.unshift(amount)
    # @dates.unshift(date)
    @dates.unshift(time_refactored)
  end

  def withdraw(amount)
    date = Time.now
    date_refactored = date.strftime('%d/%m/%Y')
    @deposits.unshift(-amount)
    @dates.unshift(date_refactored)
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
        @statement_end += "#{date} || || #{'%.2f' % -@deposits[index]} || #{'%.2f' % balance_on_date}\n"
      end
      balance_on_date -= @deposits[index]
    }
  end

end
