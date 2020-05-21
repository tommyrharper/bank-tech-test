require 'statement'

describe Statement do
  it 'creates an accurate statement with one deposit' do
    transaction_double = double :Transaction, date: '10/01/2012', amount: 1000,
                                              type: 'credit'
    expect(subject.add(transaction_double, 1000)).to eq '' \
      "10/01/2012 || 1000.00 || || 1000.00\n"
  end

  it 'creates an accurate statement with one deposit, one withdrawal' do
    transaction_double = double :Transaction, date: '10/01/2012', amount: 1000,
                                              type: 'credit'
    transaction_double2 = double :Transaction, date: '13/01/2012', amount: 500,
                                               type: 'debit'
    subject.add(transaction_double, 1000)
    expect(subject.add(transaction_double2, 500)).to eq '' \
      "13/01/2012 || || 500.00 || 500.00\n" \
      "10/01/2012 || 1000.00 || || 1000.00\n"
  end
end
