# TDD String Calculator

A simple string calculator built in Ruby to demonstrate TDD (Test-Driven Development). This calculator processes a string of numbers, handles various delimiters, and provides meaningful error handling for invalid inputs.

## Features
1. **Empty String**: Returns `0` for an empty string input.
    - Example: `""` → Output: `0`
2. **Sum of Numbers**: Sums up a string of comma-separated numbers.
    - Example: `"1"` → Output: `1`
    - Example: `"1,5"` → Output: `6`
    - Example: `"1,2,3,4"` → Output: `10`
3. **Newline Delimiters**: Supports newlines (`\n`) as delimiters in addition to commas.
    - Example: `"1\n2,3"` → Output: `6`
    - Example: `"4\n5,6\n,7"` → Output: `22`
4. **Support Different Delimiters**: Handles single, multi-character, or multiple custom delimiters.`"//[delimiter]\n[numbers]"`  
    - Example: `"//;\n1;2"` → Output: `3`
    - Example: `"//4;\n5,6;7"` → Output: `22`
    - Example: `"//1,5\n;7//"` → Output: `13`
    - Example: `"//|\n2|3|5"` → Output: `10`
    - Example: `"//[*][%]\n1*2%3"` → Output: `6`
5. **Negative Numbers**: Raises an exception when the input contains negative numbers.
    - Example: `-1` Error: `Negative numbers not allowed: -1`
    - Example: `"-1,2,-3"` → Error: `Negative numbers not allowed: -1, -3`
    - Example: `"//;\n-4;5;-6"` →  Error: `Negative numbers not allowed: -4, -6`
6. **Ignore Large Numbers**: Ignores numbers greater than 1000.
    - Example: `"1001,2"` → Output: `2`
    - Example: `"2,1000,1002"` → Output: `1002`
    - Example: `"1001,2000"` → Output: `0`
7. **Delimiters Can Be Of Any Length**: Supports multiple delimiters of any length. `"//[delimiter]\n"`  
    - Example: `"//[***]\n1***2***3"` → Output: `6`
    - Example: `"//[###]\n4###5###6"` → Output: `15`
    - Example: `"//[***][%%%]\n2***3%%%5"` → Output: `10`
    - Example: `"//[###][$$$][%%%]\n7###6$$$8%%%0"` → Output: `21`
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
    ruby test/string_calculator_test.rb
    ```

## Development Notes
1. **Regex-Based Parsing:** The implementation uses a regex `(/-?\d+/)` to match all numbers, ignoring delimiters.
2. **Error Handling:** Negative numbers are explicitly checked, and an error is raised with the list of negative values.
3. **Scalability:** Handles single and multi-character custom delimiters, multiple delimiters, and large inputs efficiently.