require 'account'

describe Account do
  context 'deposits' do
    it 'accepts a deposit and returns the amount and balance' do
      transaction_double = double(:Transaction, new: '')
      statement_double = double(:Statement, add: '')
      account = Account.new(statement_double, transaction_double)

      account.deposit(1000)

      expect(account.deposit(1000)).to eq '1000 deposited. Balance: 2000'
    end
  end

  context 'withdrawls' do
    it 'accepts a withdrawal and returns the amount and balance' do
      transaction_double = double(:Transaction, new: '')
      statement_double = double(:Statement, add: '')
      account = Account.new(statement_double, transaction_double)

      account.deposit(1000)

      expect(account.withdraw(500)).to eq '500 withdrawn. Balance: 500'
    end
  end

  it 'print_statement returns nil' do
    transaction_double = double(:Transaction, new: '')
    statement_double = double(
      :Statement,
      update: '',
      print_statement: nil
    )
    account = Account.new(statement_double, transaction_double)
    expect(account.print_statement).to eq nil
  end
end
