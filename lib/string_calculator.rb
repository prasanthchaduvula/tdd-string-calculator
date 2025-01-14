class StringCalculator
  def add(numbers_str)
    return 0 if numbers_str.empty?

    match_numbers = /-?\d+/

    numbers = numbers_str.scan(match_numbers)
    negative_nums = numbers.select { |n| n.to_i < 0 }

    raise ArgumentError, "Negative numbers not allowed: #{negative_nums.join(', ')}" if negative_nums.any?
    
    numbers.reduce(0) {|total, element| element.to_i > 1000 ? total : total + element.to_i }
  end
end