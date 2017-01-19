# Problem 1
# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def multiples_of_3_and_5_sum(number)
	list_of_multiples = generate_multiples_list(number)
	sum = add_multiples(list_of_multiples)
	return sum
end

# Helper methods
def generate_multiples_list(number)
	list = []
	for i in 0...number
		if (i % 3 == 0) || (i % 5 == 0)
			list << i
		end
	end
	return list
end

def add_multiples(array_of_multiples)
	sum = 0
	array_of_multiples.each do |multiple|
		sum += multiple
	end
	return sum
end

example_numbers_below = 10
puts "Example Answer: #{multiples_of_3_and_5_sum(example_numbers_below)}"
start = Time.now
numbers_below = 1000
puts "Answer = #{multiples_of_3_and_5_sum(numbers_below)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 233168