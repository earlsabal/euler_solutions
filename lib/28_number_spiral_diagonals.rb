# Problem 28
# Starting with the number 1 and moving to the right in a clockwise
# direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.
# What is the sum of the numbers on the diagonals in a 1001 by 1001
# spiral formed in the same way?

START_WITH_ONE = 1

def number_spiral_diagonals(size_of_square)
	diagonals = find_diagonal_numbers(size_of_square)
	sum = calculate_sum(diagonals)
	return sum
end

# Helper methods
def find_diagonal_numbers(size_of_square)
	diagonals = []
	i = START_WITH_ONE
	while i <= size_of_square
		if i == 1
			diagonals << i
		else
			bottom_right = i*i - 3*i + 3
			bottom_left = i*i - 2*i + 2
			top_left = i*i - i + 1
			top_right = i*i
			diagonals << [bottom_right, bottom_left, top_left, top_right]
		end
		i += 2
	end
	return diagonals.flatten
end

def calculate_sum(numbers)
	sum = 0
	numbers.each do |number|
		sum += number
	end
	return sum
end

example_spiral_size = 5
puts "Example Answer: #{number_spiral_diagonals(example_spiral_size)}"
start = Time.now
spiral_size = 1001
puts "Answer: #{number_spiral_diagonals(spiral_size)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 669171001