class Transaction
  attr_reader :date, :amount, :type, :balance

  def initialize(amount, type, balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @type = type
    @amount = amount
    process_transaction(balance)
  end

  private

  def process_transaction(balance)
    valid_number?(balance)
    update_balance(balance)
  end

  def update_balance(balance)
    @balance = balance + amount if @type == 'credit'
    @balance = balance - amount if @type == 'debit'
  end

  def valid_number?(balance)
    raise 'Must enter a number' if !@amount.is_a? Numeric
    raise 'Reached account limit' if @type == 'debit' && @amount > balance
    raise 'Entered more than two decimal places' if over_two_decimal_places?
  end

  def over_two_decimal_places?
    number_of_decimals = @amount.to_s.split('.')[1]
    !number_of_decimals.nil? && number_of_decimals.length > 2
  end
end
