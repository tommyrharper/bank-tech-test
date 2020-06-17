require 'transaction'

describe Transaction do
  date = Time.new(2012, 1, 10, 12)

  context 'accessing class variables' do
    it 'initialises with a date' do
      allow(Time).to receive(:now).and_return(date)

      transaction = Transaction.new(1000, 'credit', 0)

      expect(transaction.date).to eq '10/01/2012'
    end

    it 'initialises with a type' do
      allow(Time).to receive(:now).and_return(date)

      transaction = Transaction.new(1000, 'credit', 0)

      expect(transaction.type).to eq 'credit'
    end

    it 'initialises with an amount' do
      allow(Time).to receive(:now).and_return(date)

      transaction = Transaction.new(1000, 'credit', 0)

      expect(transaction.amount).to eq 1000
    end
  end

  context 'edge cases' do
    it 'does not accept a string as a parameter for amount' do
      expect { Transaction.new('string', 'credit', 0) }
        .to raise_error 'Must enter a number'
    end

    it 'does not accept a number with 3 d.p. as a parameter for amount' do
      expect { Transaction.new(5.555, 'credit', 0) }
        .to raise_error 'Entered more than two decimal places'
    end

    it 'does not allow the user to withdraw into the negative' do
      expect { Transaction.new(5.01, 'debit', 5) }
        .to raise_error 'Reached account limit'
    end
  end
end
