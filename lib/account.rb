require_relative 'transaction'
require_relative 'statement'

class Account
  def initialize(statement = Statement.new, transaction_class = Transaction)
    @balance = 0
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    transaction = @transaction_class.new(amount, 'credit', @balance)
    @balance += amount
    @statement.add(transaction, @balance)
    "#{amount} deposited. Balance: #{@balance}"
  end

  def withdraw(amount)
    transaction = @transaction_class.new(amount, 'debit', @balance)
    @balance -= amount
    @statement.add(transaction, @balance)
    "#{amount} withdrawn. Balance: #{@balance}"
  end

  def print_statement
    puts @statement.header + @statement.content
  end
end
