require 'account'

describe Account do
  context 'deposits' do
    it 'accepts a deposit and returns the amount and balance' do
      transaction_double = double(:Transaction, new: '')
      statement_double = double :Statement, add: ''
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      expect(account.deposit(1000)).to eq '1000 deposited. Balance: 2000'
    end
  end

  context 'withdrawls' do
    it 'accepts a deposit and returns the amount and balance' do
      transaction_double = double(:Transaction, new: '')
      statement_double = double :Statement, add: ''
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      expect(account.withdraw(500)).to eq '500 withdrawn. Balance: 500'
    end
  end

  context 'print_statement' do
    it 'accepts a deposits of 10.55 and prints the statement' do
      transaction_double = double(:Transaction, new: '')
      statement_double = double :Statement,
                                add: '',
                                content: "10/01/2012 || 10.55 || || 10.55\n",
                                header: "date || credit || debit || balance\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(10.55)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "10/01/2012 || 10.55 || || 10.55\n").to_stdout
    end

    it 'accepts a deposits of 1000 and a withdrawl of 500
      and prints the statement' do
      transaction_double = double(:Transaction, new: '')
      statement_double = double :Statement,
                                add: '',
                                content: "13/01/2012 || || 500.00 || 500.00\n" \
                                "10/01/2012 || 1000.00 || || 1000.00\n",
                                header: "date || credit || debit || balance\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      account.withdraw(500)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "13/01/2012 || || 500.00 || 500.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end
end
