class Account

  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize
    @dates = []
    @deposits = []
    @statement_end = ""
  end

  def deposit(amount)
    is_valid_number?(amount) 
    set_date
    @deposits.unshift(amount)
    @dates.unshift(@date)
    "#{amount} deposited. Balance: #{@deposits.sum}"
  end

  def withdraw(amount)
    is_valid_number?(amount)
    set_date
    @deposits.unshift(-amount)
    @dates.unshift(@date)
    "#{amount} withdrawn. Balance: #{@deposits.sum}"
  end

  def print_statement
    create_statement
    puts STATEMENT_HEADER + @statement_end
  end

  private

  def create_statement
    balance_on_date = @deposits.sum

    @dates.each_with_index { |date, index|
      if credit?(index)
        @statement_end += "#{date} || #{'%.2f' % @deposits[index]} || || #{'%.2f' % balance_on_date}\n"
      else
        @statement_end += "#{date} || || #{'%.2f' % -@deposits[index]} || #{'%.2f' % balance_on_date}\n"
      end
      balance_on_date -= @deposits[index]
    }
  end

  def set_date
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def credit?(index)
    @deposits[index] > 0
  end

  def is_valid_number?(amount)
    fail 'Must enter a number' unless amount.is_a? Numeric
    fail 'Cannot enter more than two decimal points' if more_than_two_decimal_places?(amount)
  end

  def more_than_two_decimal_places?(amount)
    decimals = amount.to_s.split(".")[1]
    decimals != nil && decimals.length > 2
  end

end
