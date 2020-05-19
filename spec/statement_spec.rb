require 'statement'

describe Statement do
  let(:transaction_double) do
    double :Transaction, date: '10/01/2012', credit: 1000,
                         debit: '', balance: 1000
  end
  let(:transaction_double2) do
    double :Transaction, date: '13/01/2012', credit: 1000,
                         debit: '', balance: 2000
  end
  it 'creates an accurate statement with one deposit' do
    expect(subject.add(transaction_double)).to eq '' \
      "date || credit || debit || balance\n" \
      "10/01/2012 || 1000.00 || || 1000.00\n"
  end
  it 'creates an accurate statement with two deposits' do
    subject.add(transaction_double)
    expect(subject.add(transaction_double2)).to eq '' \
      "date || credit || debit || balance\n" \
      "13/01/2012 || 1000.00 || || 2000.00\n" \
      "10/01/2012 || 1000.00 || || 1000.00\n"
  end
end
