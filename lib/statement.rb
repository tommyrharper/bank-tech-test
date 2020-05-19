class Statement
  STATEMENT_HEADER = "date || credit || debit || balance\n".freeze
  def initialize
    @statement_end = ''
  end

  def add(transaction)
    date = transaction.date
    credit = '%.2f' % transaction.credit
    debit = transaction.debit
    balance = '%.2f' % transaction.balance

    row = "#{date} || #{credit} || #{debit}|| #{balance}\n"
    @statement_end.insert(0, row)

    STATEMENT_HEADER + @statement_end
  end
end
