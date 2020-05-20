class Statement
  attr_reader :content
  def initialize
    @content = ''
  end

  def add(transaction, balance)
    convert_to_two_decimal_places(transaction, balance)
    create_row(transaction.date, @balance, @amount, transaction.type)
    @content.insert(0, @row)
  end

  private

  def convert_to_two_decimal_places(transaction, balance)
    @balance = '%.2f' % balance
    @amount = '%.2f' % transaction.amount
  end

  def create_row(date, balance, amount, type)
    @row = if type == 'credit'
             "#{date} || #{amount} || || #{balance}\n"
           else
             "#{date} || || #{amount} || #{balance}\n"
           end
  end
end
