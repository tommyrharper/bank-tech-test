require_relative 'transaction'
require_relative 'statement'

class Account
  STATEMENT_HEADER = "date || credit || debit || balance\n".freeze

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    transaction = Transaction.new(amount, 'credit')
    @balance += amount
    @statement.add(transaction, @balance)
    "#{amount} deposited. Balance: #{@balance}"
  end

  def withdraw(amount)
    transaction = Transaction.new(amount, 'debit')
    @balance -= amount
    @statement.add(transaction, @balance)
    "#{amount} withdrawn. Balance: #{@balance}"
  end

  def print_statement
    puts STATEMENT_HEADER + @statement.content
  end
end
