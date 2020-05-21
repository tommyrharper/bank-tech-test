require 'account'

describe Account do
  tenth_january = Time.new(2012, 1, 10, 12)
  thirteenth_january = Time.new(2012, 1, 13, 12)
  fifthteenth_january = Time.new(2012, 1, 15, 12)
  seventeenth_january = Time.new(2012, 1, 17, 12)

  context 'full account functionality used' do
    it 'accepts multiple deposits and withdrawals and prints the statement' do
      allow(Time).to receive(:now).and_return(tenth_january)
      subject.deposit(1000)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(thirteenth_january)
      subject.withdraw(500)
      allow(Time).to receive(:now).and_return(fifthteenth_january)
      subject.deposit(0.55)
      allow(Time).to receive(:now).and_return(seventeenth_january)
      subject.withdraw(0.18)

      expected_output = '' \
      "date || credit || debit || balance\n" \
      "17/01/2012 || || 0.18 || 1500.37\n" \
      "15/01/2012 || 0.55 || || 1500.55\n" \
      "13/01/2012 || || 500.00 || 1500.00\n" \
      "10/01/2012 || 1000.00 || || 2000.00\n" \
      "10/01/2012 || 1000.00 || || 1000.00\n"

      expect { subject.print_statement }.to output(expected_output).to_stdout
    end
  end

  context 'edge cases' do
    it 'does not accept a string as a parameter for deposit' do
      expect { subject.deposit('string') }.to raise_error 'Must enter a number'
    end

    it 'does not accept a string as a parameter for withdrawl' do
      expect { subject.withdraw('string') }.to raise_error 'Must enter a number'
    end

    it 'does not accept a number with 3 d.p. as a parameter for deposit' do
      expect { subject.deposit(5.555) }
        .to raise_error 'Cannot enter more than two decimal points'
    end

    it 'does not allow the user to withdraw into the negative' do
      expect { subject.withdraw(0.01) }
        .to raise_error 'Reached account limit'
    end
  end
end
