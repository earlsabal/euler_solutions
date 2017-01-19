# Problem 10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

START_OF_PRIMES = 2

def summation_of_primes(biggest_number)
	sum = 0
	list_of_primes = generate_prime_numbers(biggest_number)
	list_of_primes.each do |num|
		sum += num
	end
	return sum
end

# Helper methods
def generate_prime_numbers(number)
	list = []
	current_number = START_OF_PRIMES
	while current_number < number
		if check_if_prime(current_number, list) == true
			list << current_number
		end

		# Only checks if odd numbers are prime other than 2
		# since all even numbers except 2 are not prime
		if current_number == 2
			current_number += 1
		else
			current_number += 2
		end
	end
	return list
end

def check_if_prime(number, list)
	largest_possible_division = Math.sqrt(number).floor
	prime = true
	if (number != 2)
		list.each do |num|
			if num > largest_possible_division
				break
			elsif number % num == 0
				prime = false
				break
			end
		end
	end
	return prime
end

example_numbers_below = 10
puts "Example Answer: #{summation_of_primes(example_numbers_below)}"
start = Time.now
numbers_below = 2000000
puts "Example Answer: #{summation_of_primes(numbers_below)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 142913828922