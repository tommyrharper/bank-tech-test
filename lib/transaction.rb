class Transaction
  attr_reader :date, :amount, :type, :balance

  def initialize(amount, type, balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @type = type
    @amount = amount
    valid_number?(balance)
    @balance = calculate_balance(balance)
  end

  private

  def calculate_balance(balance)
    @type == 'credit' ? balance + amount : balance - amount
  end

  def valid_number?(balance)
    raise 'Must enter a number' unless @amount.is_a? Numeric
    raise 'Reached account limit' if @type == 'debit' && @amount > balance
    raise 'Cannot enter more than two decimal points' if
    over_two_decimal_places?
  end

  def over_two_decimal_places?
    number_of_decimals = @amount.to_s.split('.')[1]
    !number_of_decimals.nil? && number_of_decimals.length > 2
  end
end
