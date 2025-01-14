class StringCalculator
  NUMBER_REGEX = /-?\d+/

  def add(numbers_str)
    return 0 if numbers_str.empty?

    numbers = numbers_str.scan(NUMBER_REGEX).map(&:to_i)

    negative_nums = numbers.select(&:negative?)
    raise ArgumentError, "Negative numbers not allowed: #{negative_nums.join(', ')}" if negative_nums.any?
    
    numbers.reduce(0) {|total, num| num > 1000 ? total : total + num }
  end
end