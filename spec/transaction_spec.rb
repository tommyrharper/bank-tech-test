require 'transaction'

describe Transaction do
  date = Time.new(2012, 1, 10, 12)
  it 'initialises with a date, a credit and a debit' do
    allow(Time).to receive(:now).and_return(date)
    transaction = Transaction.new(1000, 0)
    expect(transaction.date).to eq '10/01/2012'
    expect(transaction.credit).to eq 1000
    expect(transaction.debit).to eq 0
  end
end
