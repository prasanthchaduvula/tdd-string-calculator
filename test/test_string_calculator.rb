require "minitest/autorun"
require_relative "../lib/string_calculator"

class TestStringCalculator < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string_returns_zero
    assert_equal 0, @calculator.add("")
  end

  def test_single_string_number
    assert_equal 1, @calculator.add("1")
    assert_equal 2, @calculator.add("2")
  end

  def test_two_comma_separated_numbers
    assert_equal 6, @calculator.add("1,5")
    assert_equal 7, @calculator.add("3,4")
  end
end