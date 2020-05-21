require 'transaction'

describe Transaction do
  date = Time.new(2012, 1, 10, 12)
  it 'initialises with a date, a type and an amount' do
    allow(Time).to receive(:now).and_return(date)
    transaction = Transaction.new(1000, 'credit', 0)
    expect(transaction.date).to eq '10/01/2012'
    expect(transaction.amount).to eq 1000
    expect(transaction.type).to eq 'credit'
  end

  context 'edge cases' do
    it 'does not accept a string as a parameter for amount' do
      expect { Transaction.new('string', 'credit', 0) }
        .to raise_error 'Must enter a number'
    end

    it 'does not accept a number with 3 d.p. as a parameter for amount' do
      expect { Transaction.new(5.555, 'credit', 0) }
        .to raise_error 'Cannot enter more than two decimal points'
    end

    it 'does not allow the user to withdraw into the negative' do
      expect { Transaction.new(5.01, 'debit', 5) }
        .to raise_error 'Reached account limit'
    end
  end
end
