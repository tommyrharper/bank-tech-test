require 'statement'

describe Statement do
  it 'creates an accurate statement with one deposit' do
    transaction_double = double(
      :Transaction,
      date: '10/01/2012',
      amount: 1000,
      type: 'credit',
      balance: 1000
    )

    transactions = [transaction_double]
    subject.add(transactions)

    expected_output = "10/01/2012 || 1000.00 || || 1000.00\n"

    expect(subject.content).to eq expected_output
  end

  it 'creates an accurate statement with one deposit, one withdrawal' do
    transaction_double = double(
      :Transaction,
      date: '10/01/2012',
      amount: 1000,
      type: 'credit',
      balance: 1000
    )
    transaction_double_two = double(
      :Transaction,
      date: '13/01/2012',
      amount: 500,
      type: 'debit',
      balance: 500
    )

    transactions = [transaction_double, transaction_double_two]
    subject.add(transactions)

    expected_output = "13/01/2012 || || 500.00 || 500.00\n" \
                      "10/01/2012 || 1000.00 || || 1000.00\n"

    expect(subject.content).to eq expected_output
  end
end
