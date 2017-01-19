# Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

START_OF_PRIME_FACTORS = 2

def largest_prime_factor(number)
	list_of_prime_factors = get_prime_factors(number)
	largest_prime = list_of_prime_factors.last
	return largest_prime
end

# Helper methods
def get_prime_factors(number)
	list = []
		for i in START_OF_PRIME_FACTORS...last_divisor_check(number)
		if (number % i == 0) && (check_prime(i) == true)
			list << i
			if check_prime(number / i) == true
				list << number / i
			end
		end
	end
	return list
end

def check_prime(number)
	prime = true
	for i in START_OF_PRIME_FACTORS...last_divisor_check(number)
		if number % i == 0
			prime = false
			break
		end
	end
	return prime
end

def last_divisor_check(number)
	return Math.sqrt(number)
end

example_test_number = 13195
puts "Example Answer: #{largest_prime_factor(example_test_number)}"
start = Time.now
test_number = 600851475143
puts "Answer: #{largest_prime_factor(test_number)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 6857