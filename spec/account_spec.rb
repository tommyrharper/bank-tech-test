require 'account'

describe Account do

  it 'accepts a deposit of 1000 with a date and prints the statement' do
    subject.deposit(1000, "10/01/2012")
    expect{ subject.print_statement }.to output(
      "date || credit || debit || balance\n"+
      "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
  end

  it 'accepts a deposit of 2000 on a new date and prints the statement' do
    subject.deposit(2000, "13/01/2012")
    expect{ subject.print_statement }.to output(
      "date || credit || debit || balance\n"+
      "13/01/2012 || 2000.00 || || 2000.00\n").to_stdout
  end


  it 'accepts a two deposits of 1000 and prints the statement' do
    subject.deposit(1000, "10/01/2012")
    subject.deposit(1000, "13/01/2012")
    expect{ subject.print_statement }.to output(
      "date || credit || debit || balance\n"+
      "13/01/2012 || 1000.00 || || 2000.00\n"+
      "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
  end

  it 'accepts a three deposits of 1000 and prints the statement' do
    subject.deposit(1000, "10/01/2012")
    subject.deposit(1000, "13/01/2012")
    subject.deposit(1000, "15/01/2012")
    expect{ subject.print_statement }.to output(
      "date || credit || debit || balance\n"+
      "15/01/2012 || 1000.00 || || 3000.00\n"+
      "13/01/2012 || 1000.00 || || 2000.00\n"+
      "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
  end


end
