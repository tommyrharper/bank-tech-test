require 'account'

describe Account do
  context 'deposits' do
    it 'accepts a deposits of 10.55 and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "10/01/2012 || 10.55 || || 10.55\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(10.55)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "10/01/2012 || 10.55 || || 10.55\n").to_stdout
    end
    it 'accepts a deposit of 1000 with a date and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "10/01/2012 || 1000.00 || || 1000.00\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts a deposit of 2000 on a new date and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "13/01/2012 || 2000.00 || || 2000.00\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(2000)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "13/01/2012 || 2000.00 || || 2000.00\n").to_stdout
    end
    it 'accepts a two deposits and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "13/01/2012 || 1.00 || || 1001.00\n" \
                                "10/01/2012 || 1000.00 || || 1000.00\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      account.deposit(1000)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "13/01/2012 || 1.00 || || 1001.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts a three deposits and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "15/01/2012 || 1.00 || || 2001.00\n" \
                                "13/01/2012 || 1000.00 || || 2000.00\n" \
                                "10/01/2012 || 1000.00 || || 1000.00\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      account.deposit(1000)
      account.deposit(1)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "15/01/2012 || 1.00 || || 2001.00\n" \
        "13/01/2012 || 1000.00 || || 2000.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts a four deposits and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "17/01/2012 || 1.00 || || 3001.00\n" \
                                "15/01/2012 || 1000.00 || || 3000.00\n" \
                                "13/01/2012 || 1000.00 || || 2000.00\n" \
                                "10/01/2012 || 1000.00 || || 1000.00\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      account.deposit(1000)
      account.deposit(1000)
      account.deposit(1)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "17/01/2012 || 1.00 || || 3001.00\n" \
        "15/01/2012 || 1000.00 || || 3000.00\n" \
        "13/01/2012 || 1000.00 || || 2000.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
  end

  context 'withdrawls' do
    it 'accepts a deposits of 1000 and a withdrawl of 500
      and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "13/01/2012 || || 500.00 || 500.00\n" \
                                "10/01/2012 || 1000.00 || || 1000.00\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(1000)
      account.withdraw(500)
      expect { account.print_statement }.to output('' \
        "date || credit || debit || balance\n" \
        "13/01/2012 || || 500.00 || 500.00\n" \
        "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
    end
    it 'accepts a deposits of 10 and a withdrawl of 4.45
    and prints the statement' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement,
                                add: '',
                                content: "13/01/2012 || || 4.45 || 5.55\n" \
                                "10/01/2012 || 10.00 || || 10.00\n"
      account = Account.new(statement_double, transaction_double)
      account.deposit(10)
      account.withdraw(4.45)
      expect { account.print_statement }.to output('' \
      "date || credit || debit || balance\n" \
      "13/01/2012 || || 4.45 || 5.55\n" \
      "10/01/2012 || 10.00 || || 10.00\n").to_stdout
    end
  end

  context 'edge cases' do
    it 'does not accept a string as a parameter for deposit' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement
      expect(transaction_double).to receive(:new)
        .and_raise('Must enter a number')
      account = Account.new(statement_double, transaction_double)
      expect { account.deposit('string') }.to raise_error 'Must enter a number'
    end
    it 'does not accept a string as a parameter for withdrawl' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement
      expect(transaction_double).to receive(:new)
        .and_raise('Must enter a number')
      account = Account.new(statement_double, transaction_double)
      expect { account.withdraw('string') }.to raise_error 'Must enter a number'
    end
    it 'does not accept a number with 3 d.p. as a parameter for deposit' do
      transaction_double = double :Transaction, new: ''
      statement_double = double :Statement
      expect(transaction_double).to receive(:new)
        .and_raise('Cannot enter more than two decimal points')
      account = Account.new(statement_double, transaction_double)
      expect { account.deposit(5.555) }
        .to raise_error 'Cannot enter more than two decimal points'
    end
  end
end
