# TDD String Calculator

A simple string calculator built in Ruby to demonstrate TDD (Test-Driven Development). This calculator processes a string of numbers, handles various delimiters, and provides meaningful error handling for invalid inputs.

## Features
1. **Empty String**: Returns `0` for an empty string input.
    ```ruby
    "" # => 0
    ```
2. **Sum of Numbers**: Sums up a string of comma-separated numbers.
    ```ruby
    "1"       # => 1
    "1,5"     # => 6
    "1,2,3,4" # => 10
    ```
3. **Newline Delimiters**: Supports newlines (`\n`) as delimiters in addition to commas.
    ```ruby
    "1\n2,3"     # => 6
    "4\n5,6\n,7" # => 22
    ```
4. **Support Different Delimiters**: To change a delimiter, the beginning of the string will contain a separate line that looks like this: `“//[delimiter]\n[numbers…]”`.
    ```ruby
    "//;\n1;2"        # => 3
    "//4;\n5,6;7"     # => 22
    "//1,5\n;7//"     # => 13
    
    ``` 
5. **Negative Numbers**: Raises an exception when the input contains negative numbers.
    ```ruby
    "-1"           # => Negative numbers not allowed: -1
    "-1,2,-3"      # => Negative numbers not allowed: -1, -3
    "//;\n-4;5;-6" # => Negative numbers not allowed: -4, -6
    ```
6. **Ignore Large Numbers**: Ignores numbers greater than 1000.
    ```ruby
    "1001,2"      # => 2
    "2,1000,1002" # => 1002
    "1001,2000"   # => 0
    ```
7. **Delimiters Can Be Of Any Length**: `//[delimiter]\n`
    ```ruby
    "//[***]\n1***2***3" # => 6
    "//[###]\n4###5###6" # => 15
    ```
8. **Allow multiple delimiters**: `“//[delim1][delim2]\n”`
    ```ruby
    "//[*][%]\n1*2%3" # => 6
    "//|\n2|3|5"      # => 10
    ```
9. **Handle multiple delimiters with length longer than one char**:
    ```ruby
    "//[***][%%%]\n2***3%%%5"          # => 10
    "//[###][$$$][%%%]\n7###6$$$8%%%0" # => 21
    ```

---

## Installation

1. Ensure you have [Ruby](https://www.ruby-lang.org/) installed (version 3.3.0 recommended).
2. Clone this repository:
    ```bash
    git clone https://github.com/prasanthchaduvula/tdd-string-calculator.git
    ```

## Setup

- Install required dependencies using Bundler
    ```bash
    bundle install
    ```

## Usage
- **Open IRB:** Start an Interactive Ruby session (IRB) and load the StringCalculator class located in lib:
    ```bash
    irb -r './lib/string_calculator.rb'
    ```
- **Using the StringCalculator:**
    ```ruby
    calculator = StringCalculator.new
    calculator.add("")                        # => 0
    calculator.add("1")                       # => 1
    calculator.add("1,5")                     # => 6
    calculator.add("1,2,3,4")                 # => 10
    calculator.add("1\n2,3")                  # => 6
    calculator.add("//;\n1;2")                # => 3
    calculator.add("//1,5\n;7//")             # => 13
    calculator.add("//|\n2|3|5")              # => 10
    calculator.add("-1")                      # => Negative numbers not allowed: -1
    calculator.add("-1,2,-3")                 # => Negative numbers not allowed: -1, -3
    calculator.add("//;\n-4;5;-6")            # => Negative numbers not allowed: -4, -6
    calculator.add("1001,2")                  # => 2
    calculator.add("//[*][%]\n1*2%3")         # => 6
    calculator.add("//[***]\n1***2")          # => 3
    calculator.add("//[***][%%%]\n2***3%%%5") # => 10
    calculator.add("//[***]\n")               # => 0
    ```

## Testing

- Ensure Ruby is installed, and version 3.3.0 (or your preferred Ruby version) is selected.

- Run the following command to execute the tests:

    ```bash
    ruby test/test_string_calculator.rb
    ```

## Development Notes
1. **Regex-Based Parsing:** The implementation uses a regex `(/-?\d+/)` to match all numbers, ignoring delimiters.
2. **Error Handling:** Negative numbers are explicitly checked, and an error is raised with the list of negative values.
3. **Scalability:** Handles single and multi-character custom delimiters, multiple delimiters, and large inputs efficiently.