require 'transaction'

describe Transaction do
  it 'initialises with a date, a credit, a debit and a balance' do
    date = '10/01/2012'
    transaction = Transaction.new(date, 1000, 0, 2000)
    expect(transaction.date).to eq '10/01/2012'
    expect(transaction.credit).to eq 1000
    expect(transaction.debit).to eq 0
    expect(transaction.balance).to eq 2000
  end
end
