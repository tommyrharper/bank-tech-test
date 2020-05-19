class Statement
  attr_reader :content
  def initialize
    @content = ''
  end

  def add(transaction, balance)
    insert_row(transaction.date, balance,
               transaction.amount, transaction.type)
  end

  private

  def insert_row(date, balance, amount, type)
    # '%.2f' converts numbers to 2.d.p.
    balance = '%.2f' % balance
    amount = '%.2f' % amount
    row = if type == 'credit'
            "#{date} || #{amount} || || #{balance}\n"
          else
            "#{date} || || #{amount} || #{balance}\n"
          end
    @content.insert(0, row)
  end
end
