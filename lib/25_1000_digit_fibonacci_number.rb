# Problem 25
# The Fibonacci sequence is defined by the recurrence relation:
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
# What is the index of the first term in the Fibonacci sequence to contain
# 1000 digits?

FIRST_SEQUENCE_NUMBER = 1
SECOND_SEQUENCE_NUMBER = 1
STARTING_INDEX = 3

def x_digit_fibonacci_number(number_of_digits)
	index = STARTING_INDEX
	sequence = [0, FIRST_SEQUENCE_NUMBER, SECOND_SEQUENCE_NUMBER]
	found_sequence = false
	while found_sequence == false
		current_sequence_number = calculate_sequence_number(index, sequence)
		sequence << current_sequence_number
		if current_sequence_number.to_s.length == number_of_digits
			found_sequence = true
		else
			index += 1
		end
	end
	return index
end

# Helper method
def calculate_sequence_number(index, sequence)
	number = sequence[index - 1] + sequence[index - 2]
	return number
end

example_digit_number = 3
puts "Example Answer: #{x_digit_fibonacci_number(example_digit_number)}"
start = Time.now
digit_number = 1000
puts "Answer: #{x_digit_fibonacci_number(digit_number)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 4782