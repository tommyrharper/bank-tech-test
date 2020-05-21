class Statement
  STATEMENT_HEADER = "date || credit || debit || balance\n".freeze
  attr_reader :content, :header

  def initialize
    @header = STATEMENT_HEADER
    @content = ''
  end

  def print_statement
    puts STATEMENT_HEADER + @content
  end

  def update(transactions)
    transactions.each do |transaction|
      convert_to_two_decimal_places(transaction.amount, transaction.balance)
      create_row(transaction.date, @balance, @amount, transaction.type)
      @content.insert(0, @row)
    end
  end

  private

  def convert_to_two_decimal_places(amount, balance)
    @amount = '%.2f' % amount
    @balance = '%.2f' % balance
  end

  def create_row(date, balance, amount, type)
    @row = "#{date} || #{amount} || || #{balance}\n" if type == 'credit'
    @row = "#{date} || || #{amount} || #{balance}\n" if type == 'debit'
  end
end
