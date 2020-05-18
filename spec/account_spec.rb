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
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "10/01/2012 || 10.55 || || 10.55\n").to_stdout
    end

    it 'accepts a deposit of 1000 with a date and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  
    it 'accepts a deposit of 2000 on a new date and prints the statement' do
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(2000)
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "13/01/2012 || 2000.00 || || 2000.00\n").to_stdout
    end
  
  
    it 'accepts a two deposits of 1000 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(1000)
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "13/01/2012 || 1000.00 || || 2000.00\n"+
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  
    it 'accepts a three deposits of 1000 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date3)
      subject.deposit(1000)
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "15/01/2012 || 1000.00 || || 3000.00\n"+
        "13/01/2012 || 1000.00 || || 2000.00\n"+
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  
    it 'accepts a four deposits of 1000 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date3)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date4)
      subject.deposit(1000)
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "17/01/2012 || 1000.00 || || 4000.00\n"+
        "15/01/2012 || 1000.00 || || 3000.00\n"+
        "13/01/2012 || 1000.00 || || 2000.00\n"+
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    
  end

  context 'withdrawls' do

    it 'accepts a deposits of 1000 and a withdrawl of 500 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(1000)
      allow(Time).to receive(:now).and_return(date2)
      subject.withdraw(500)
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "13/01/2012 || || 500.00 || 500.00\n"+
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  
  
    it 'accepts a deposits of 10 and a withdrawl of 4.45 and prints the statement' do
      allow(Time).to receive(:now).and_return(date1)
      subject.deposit(10)
      allow(Time).to receive(:now).and_return(date2)
      subject.withdraw(4.45)
      expect{ subject.print_statement }.to output(
        "date || credit || debit || balance\n"+
        "13/01/2012 || || 4.45 || 5.55\n"+
        "10/01/2012 || 10.00 || || 10.00\n").to_stdout
    end

  end

end
