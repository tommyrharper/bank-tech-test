require 'transaction'

describe Transaction do
  date = Time.new(2012, 1, 10, 12)
  it 'initialises with a date, a type and an amount' do
    allow(Time).to receive(:now).and_return(date)
    transaction = Transaction.new(1000, 'credit')
    expect(transaction.date).to eq '10/01/2012'
    expect(transaction.amount).to eq 1000
    expect(transaction.type).to eq 'credit'
  end
end
