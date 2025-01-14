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

  def test_multiple_comma_separated_numbers
    assert_equal 10, @calculator.add("1,2,3,4")
    assert_equal 15, @calculator.add("5,5,5")
  end

  def test_newline_as_delimiter
    assert_equal 6, @calculator.add("1\n2,3")
    assert_equal 22, @calculator.add("4\n5,6\n,7")
  end

  def test_different_delimters
    assert_equal 3, @calculator.add("//;\n1;2")
    assert_equal 22, @calculator.add("//4;\n5,6;7")
    assert_equal 13, @calculator.add("//1,5\n;7//")
    assert_equal 10, @calculator.add("//|\n2|3|5")
  end

  def test_throw_exception_for_negative_numbers
    error = assert_raises(ArgumentError) { @calculator.add("-1") }
    assert_equal "Negative numbers not allowed: -1", error.message

    error = assert_raises(ArgumentError) { @calculator.add("-1,2,-3") }
    assert_equal "Negative numbers not allowed: -1, -3", error.message

    error = assert_raises(ArgumentError) { @calculator.add("//;\n-4;5;-6") }
    assert_equal "Negative numbers not allowed: -4, -6", error.message
  end

  def test_ignore_numbers_bigger_than_1000
    assert_equal 2, @calculator.add("2,1001")
    assert_equal 1002, @calculator.add("2,1000")
  end

  def test_all_numbers_greater_than_1000
    assert_equal 0, @calculator.add("1001,2000")
  end
end