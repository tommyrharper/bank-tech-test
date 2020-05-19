require_relative 'transaction'
require_relative 'statement'

class Account
  STATEMENT_HEADER = "date || credit || debit || balance\n".freeze

  def initialize
    @balance = 0
    @transactions = []
    @statement_instance = Statement.new
  end

  def deposit(amount)
    valid_number?(amount)
    @balance += amount
    @transactions << Transaction.new(Time.now.strftime('%d/%m/%Y'), amount, 0, @balance)
    @statement_instance.add(@transactions.pop)
    "#{amount} deposited. Balance: #{@balance}"
  end

  def withdraw(amount)
    valid_number?(amount)
    @balance -= amount
    @transactions << Transaction.new(Time.now.strftime('%d/%m/%Y'), 0, amount, @balance)
    @statement_instance.add(@transactions.pop)
    "#{amount} withdrawn. Balance: #{@balance}"
  end

  def print_statement
    puts STATEMENT_HEADER + @statement_instance.statement_end
  end

  private

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
