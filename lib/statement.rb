class Statement
  attr_reader :content
  STATEMENT_HEADER = "date || credit || debit || balance\n".freeze
  def initialize
    @content = ''
  end

  def add(transaction)
    insert_row(transaction.date, transaction.balance,
               transaction.credit, transaction.debit)
    STATEMENT_HEADER + @content
  end

  private

  def insert_row(date, balance, credit, debit)
    # '%.2f' converts numbers to 2.d.p.
    balance = '%.2f' % balance
    # If credit or debit is zero it is set as an empty string
    # Else it is converted to 2.d.p. with a space at the end
    credit = credit.zero? ? '' : '%.2f' % credit + ' '
    debit = debit.zero? ? '' : '%.2f' % debit + ' '

    row = "#{date} || #{credit}|| #{debit}|| #{balance}\n"
    @content.insert(0, row)
  end
end
