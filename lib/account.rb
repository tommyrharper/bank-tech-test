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
      update_statment(date, balance, index)
      balance -= @deposits[index]
    end
  end

  def update_statment(date, balance, index)
    credit = '%.2f' % @deposits[index]
    debit = '%.2f' % -@deposits[index]
    @statement += if credit?(index)
                    "#{date} || #{credit} || || #{'%.2f' % balance}\n"
                  else
                    "#{date} || || #{debit} || #{'%.2f' % balance}\n"
                  end
  end

  def set_date
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def credit?(index)
    @deposits[index].positive?
  end

  def valid_number?(amount)
    raise 'Must enter a number' unless amount.is_a? Numeric
    raise 'Cannot enter more than two decimal points' if
    more_than_two_decimal_places?(amount)
  end

  def more_than_two_decimal_places?(amount)
    decimals = amount.to_s.split('.')[1]
    !decimals.nil? && decimals.length > 2
  end
end
