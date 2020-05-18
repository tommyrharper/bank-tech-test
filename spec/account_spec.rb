require 'account'

describe Account do

  it 'accepts a deposit of 1000 with a date and prints the correct information' do
    account = Account.new
    account.deposit(1000, "10/01/2012")
    expect{ account.print_statement }.to output("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00").to_stdout
  end

end
