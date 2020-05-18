class Account
  STATEMENT_HEADER = "date || credit || debit || balance\n".freeze

  def initialize
    @dates = []
    @deposits = []
    @statement = ''
  end

  def deposit(amount)
    valid_number?(amount)
    set_date
    @deposits.unshift(amount)
    @dates.unshift(@date)
    "#{amount} deposited. Balance: #{@deposits.sum}"
  end

  def withdraw(amount)
    valid_number?(amount)
    set_date
    @deposits.unshift(-amount)
    @dates.unshift(@date)
    "#{amount} withdrawn. Balance: #{@deposits.sum}"
  end

  def print_statement
    create_statement
    puts STATEMENT_HEADER + @statement
  end

  private

  def create_statement
    balance = @deposits.sum
    @dates.each_with_index do |date, index|
      add_row(date, balance, index)
      balance -= @deposits[index]
    end
  end

  def add_row(date, balance, index)
    # '%.2f' % formats numbers to 2 d.p.
    credit = '%.2f' % @deposits[index]
    debit = '%.2f' % -@deposits[index]
    balance = '%.2f' % balance
    @statement += if credit?(index)
                    "#{date} || #{credit} || || #{balance}\n"
                  else
                    "#{date} || || #{debit} || #{balance}\n"
                  end
  end

  def set_date
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def credit?(index)
    @deposits[index].positive?
  end

  def valid_number?(number)
    raise 'Must enter a number' unless number.is_a? Numeric
    raise 'Cannot enter more than two decimal points' if
    over_two_decimal_places?(number)
  end

  def over_two_decimal_places?(number)
    # This counts the number of decimal places
    decimals = number.to_s.split('.')[1]
    !decimals.nil? && decimals.length > 2
  end
end
