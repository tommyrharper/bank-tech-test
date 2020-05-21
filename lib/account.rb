require_relative 'transaction'
require_relative 'statement'

class Account
  def initialize(statement = Statement.new, transaction_class = Transaction)
    @balance = 0
    @transaction_list = []
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    transaction = @transaction_class.new(amount, 'credit', @balance)
    @transaction_list << transaction
    @balance += amount
    "#{amount} deposited. Balance: #{@balance}"
  end

  def withdraw(amount)
    transaction = @transaction_class.new(amount, 'debit', @balance)
    @transaction_list << transaction
    @balance -= amount
    "#{amount} withdrawn. Balance: #{@balance}"
  end

  def print_statement
    @statement.add(@transaction_list)
    puts @statement.header + @statement.content
  end
end
