class Statement
  attr_reader :content
  def initialize
    @content = ''
  end

  def add(transaction, balance)
    convert_to_two_decimal_places(transaction.amount, balance)
    create_row(transaction.date, @balance, @amount, transaction.type)
    @content.insert(0, @row)
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
