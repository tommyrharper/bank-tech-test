class Transaction
  attr_reader :date, :amount, :type
  def initialize(amount, type, balance)
    @date = Time.now.strftime('%d/%m/%Y')
    @type = type
    @amount = amount
    valid_number?(balance)
  end

  private

  def valid_number?(balance)
    raise 'Must enter a number' unless @amount.is_a? Numeric
    raise 'Reached account limit' if @type == 'debit' && @amount > balance
    raise 'Cannot enter more than two decimal points' if
    over_two_decimal_places?
  end

  def over_two_decimal_places?
    # This counts the number of decimal places
    decimals = @amount.to_s.split('.')[1]
    !decimals.nil? && decimals.length > 2
  end
end
