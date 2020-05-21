require_relative 'transaction'
require_relative 'statement'

class Account
  def initialize(statement = Statement.new, transaction_class = Transaction)
    @balance = 0
    @transactions = []
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    transaction = @transaction_class.new(amount, 'credit', @balance)
    @transactions << transaction
    @balance += amount
    "#{amount} deposited. Balance: #{@balance}"
  end

  def withdraw(amount)
    transaction = @transaction_class.new(amount, 'debit', @balance)
    @transactions << transaction
    @balance -= amount
    "#{amount} withdrawn. Balance: #{@balance}"
  end

  def print_statement
    @statement.add(@transactions)
    puts @statement.header + @statement.content
  end
end
