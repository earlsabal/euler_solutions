# Problem 5
# 2520 is the smallest number that can be divided by each of the numbers 
# from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of 
# the numbers from 1 to 20?

START_OF_PRIMES = 2

def smallest_multiple(number_of_consecutive_divisions)
	product = product_of_primes(number_of_consecutive_divisions)
	the_smallest_multiple = product
	number_found = false
	while number_found == false
		number_found = true
		if evenly_divisible_check(the_smallest_multiple, number_of_consecutive_divisions) == false
			number_found = false
			the_smallest_multiple += product
		end
	end
	return the_smallest_multiple
end

# Helper methods
def evenly_divisible_check(number, divisions)
	for i in 0...divisions
		if number % (divisions - i) != 0
			return false
		end
	end
	return true
end

def product_of_primes(number)
	product = START_OF_PRIMES
	for i in START_OF_PRIMES..number
		if (i == 2) || (prime_check(i) == true)
			product *= i
		end
	end
	return product
end

def prime_check(number)
	prime = true
	for i in START_OF_PRIMES...number
		if number % i == 0
			prime = false
			break
		end
	end
	return prime
end

example_consecutive_divisions = 10
puts "Example Answer: #{smallest_multiple(example_consecutive_divisions)}"
start = Time.now
consecutive_divisions = 20
puts "Answer: #{smallest_multiple(consecutive_divisions)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 232792560