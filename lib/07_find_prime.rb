# Problem 7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
# we can see that the 6th prime is 13.
# What is the 10 001st prime number?

START_OF_PRIMES = 2

def find_prime(number)
	prime_numbers = generate_prime_numbers(number)
	target_prime = prime_numbers.last
	return target_prime
end

# Helper methods
def generate_prime_numbers(number)
	list = []
	current_number = START_OF_PRIMES
	while list.size != number
		if prime_check(current_number, list) == true
			list << current_number
		end
		current_number += 1
	end
	return list
end

def prime_check(number, list)
	last_possible_division = Math.sqrt(number)
	is_prime = true
	if (number != 2)
		list.each do |num|
			if num > last_possible_division
				break
			elsif number % num == 0
				is_prime = false
				break
			end
		end
	end
	return is_prime
end

example_prime_target = 6
puts "Example Answer: #{find_prime(example_prime_target)}"
start = Time.now
prime_target = 10001
puts "Answer: #{find_prime(prime_target)}"
puts "Execution Time: #{Time.now - start}"
# Answer = 104743