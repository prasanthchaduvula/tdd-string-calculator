class StringCalculator
  def add(numbers_str)
    return 0 if numbers_str.empty?

    numbers_str.split(",").reduce(0) { |total, element| total + element.to_i }
  end
end