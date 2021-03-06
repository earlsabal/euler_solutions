# Problem 2
# Each new term in the Fibonacci sequence is generated by adding the 
# previous two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not 
# exceed four million, find the sum of the even-valued terms.

START_OF_FIBONACCI_SEQUENCE = 2
FIRST_PREVIOUS = 1

def sum_of_fibonacci_sequence_even_numbers(max_number)
	sum = 0
	list_of_evens = find_evens_in_sequence(max_number)
	list_of_evens.each do |number|
		sum += number
	end
	return sum
end

# Helper method
def find_evens_in_sequence(max)
	current_number = START_OF_FIBONACCI_SEQUENCE
	previous = FIRST_PREVIOUS
	list = []

	# fibonacci sequence
	while current_number < max
		# checks if current number is even
		if (current_number % 2 == 0)
			list << current_number
		end

		new_previous = current_number
		current_number = current_number + previous
		previous = new_previous
	end
	return list
end

start = Time.now
max_number = 4000000
puts "Answer: #{sum_of_fibonacci_sequence_even_numbers(max_number)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 4613732