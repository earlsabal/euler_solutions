# Problem 14
# The following iterative sequence is defined for the set of 
# positive integers:
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, 
# we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) 
# contains 10 terms. Although it has not been proved yet (Collatz Problem),
# it is thought that all starting numbers finish at 1.
# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.
PREVIOUS_COMPLETED_CHAINS = {}

def longest_collatz_sequence(start_number, cap_number)
	answer = start_number
	longest_chain = 0
	while start_number < cap_number
		current_chain = generate_chain(start_number)
		if longest_chain < current_chain
			longest_chain = current_chain
			answer = start_number
		end
		start_number += 1
	end
	return answer
end

# Helper methods
def generate_chain(starting_number)
	chain = 0
	number = starting_number
	while number != 1
		if PREVIOUS_COMPLETED_CHAINS.has_key?(number)
			chain += PREVIOUS_COMPLETED_CHAINS[number]
			break
		elsif number % 2 == 0
			number = number / 2
		else
			number = 3 * number + 1
		end
		chain += 1
	end
	PREVIOUS_COMPLETED_CHAINS.store(starting_number, chain)
	return chain
end

start = Time.now
start_number = 1
cap = 1000000
puts longest_collatz_sequence(start_number, cap)
puts "Execution Time: #{Time.now - start}"
# Answer is 837799