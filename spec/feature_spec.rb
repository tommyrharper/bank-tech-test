require 'account'

describe Account do
  date1 = Time.new(2012, 1, 10, 12)
  date2 = Time.new(2012, 1, 13, 12)
  date3 = Time.new(2012, 1, 15, 12)
  date4 = Time.new(2012, 1, 17, 12)

  context 'deposits' do
    it 'accepts a deposits of 10.55 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(10.55)
      expect { subject.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "10/01/2012 || 10.55 || || 10.55\n").to_stdout
    end
    it 'accepts a deposit of 1000 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      expect { subject.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts a deposit of 2000 on a new date and prints the statement' do
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(2000)
      expect { subject.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "13/01/2012 || 2000.00 || || 2000.00\n").to_stdout
    end
    it 'accepts two deposits of 1000 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(1000)
      expect { subject.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "13/01/2012 || 1000.00 || || 2000.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts three deposits of 1000 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date3)
      subject.deposit(1000)
      expect { subject.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "15/01/2012 || 1000.00 || || 3000.00\n" \
        "13/01/2012 || 1000.00 || || 2000.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts four deposits of 1000 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date3)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date4)
      subject.deposit(1000)
      expect { subject.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "17/01/2012 || 1000.00 || || 4000.00\n" \
        "15/01/2012 || 1000.00 || || 3000.00\n" \
        "13/01/2012 || 1000.00 || || 2000.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end

  context 'withdrawls' do
    it 'accepts a deposits of 1000 and a withdrawl of 500
      and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.withdraw(500)
      expect { subject.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "13/01/2012 || || 500.00 || 500.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts a deposits of 10 and a withdrawl of 4.45
    and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(10)
      allow(Time).to receive(:now).and_return(date2)
      subject.withdraw(4.45)
      expect { subject.print_statement }.to output('' \
      "date || credit || debit || balance\n" \
      "13/01/2012 || || 4.45 || 5.55\n" \
      "10/01/2012 || 10.00 || || 10.00\n").to_stdout
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