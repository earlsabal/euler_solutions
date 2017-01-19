# Problem 6
# The sum of the squares of the first ten natural numbers is,
# 1**2 + 2**2 + ... + 10**2 = 385
# The square of the sum of the first ten natural numbers is,
# (1 + 2 + ... + 10)**2 = 55**2 = 3025
# Hence the difference between the sum of the squares of the
# first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
# Find the difference between the sum of the squares of the 
# first one hundred natural numbers and the square of the sum.

def sum_square_difference(up_to_this_number)
	sum, sum_of_squares = find_both_sum_and_sum_of_squares(up_to_this_number)
	square_of_sum = sum * sum
	difference = square_of_sum - sum_of_squares
	return difference
end

# Helper methods
def find_both_sum_and_sum_of_squares(up_to_this_number)
	sum = 0
	squares_summed = 0
	for i in 0..up_to_this_number
		sum += i
		squares_summed += i * i
	end
	return sum, squares_summed
end

example_last_number = 10
puts "Example Answer: #{sum_square_difference(example_last_number)}"
start = Time.now
last_number = 100
puts "Answer: #{sum_square_difference(last_number)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 25164150