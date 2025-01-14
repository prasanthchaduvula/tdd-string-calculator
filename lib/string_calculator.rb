class StringCalculator
  def add(numbers_str)
    return 0 if numbers_str.empty?

    match_numbers = /\d+/

    numbers_str.scan(match_numbers).reduce(0) { |total, element| total + element.to_i }
  end
end