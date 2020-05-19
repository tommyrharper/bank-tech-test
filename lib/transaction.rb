class Transaction
  attr_reader :date, :amount, :type
  def initialize(amount, type)
    valid_number?(amount)
    @date = Time.now.strftime('%d/%m/%Y')
    @type = type
    @amount = amount
  end

  private

  def valid_number?(number)
    raise 'Must enter a number' unless number.is_a? Numeric
    raise 'Cannot enter more than two decimal points' if
    over_two_decimal_places?(number)
  end

  def over_two_decimal_places?(number)
    # This counts the number of decimal places
    decimals = number.to_s.split('.')[1]
    !decimals.nil? && decimals.length > 2
  end
end
