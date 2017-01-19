# Problem 27
# Euler discovered the remarkable quadratic formula:
# n**2 + n + 41
# It turns out that the formula will produce 40 primes for the
# consecutive integer values 0 ≤ n ≤ 39. However, when
# n = 40, 40**2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41,
# and certainly when n = 41, 41**2 + 41 +41 is clearly divisible by 41.
# The incredible formula n**2 − 79n +1601 was discovered, which produces
# 80 primes for the consecutive values 0 ≤ n≤ 79. The product of the
# coefficients, −79 and 1601, is −126479.
# Considering quadratics of the form:
# n**2 + an + b, where |a| < 1000 and |b| ≤ 1000
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic
# expression that produces the maximum number of primes for consecutive
# values of n, starting with n = 0.

LIST_OF_PRIMES = []

def quadratic_primes(number_limit)
	start = -(number_limit - 1)
	a, b = find_a_and_b(start, number_limit)
	product = a * b
	return product
end

# Helper methods
def find_a_and_b(start, limit)
	max_number_of_primes = 0
	final_a, final_b = 0, 0
	for a in start...limit
		for b in start..limit
			n = 0
			consecutive_primes = 0
			while prime_check(n**2 + a*n + b) == true
				consecutive_primes += 1
				n += 1
			end
			if consecutive_primes > max_number_of_primes
				final_a, final_b = a, b
				max_number_of_primes = consecutive_primes
			end
		end
	end
	return final_a, final_b
end

def prime_check(number_to_check)
	if (number_to_check <= 1)
		return false
	end
	last_divisor_check = Math.sqrt(number_to_check)
	LIST_OF_PRIMES.each do |divisor|
		if divisor > last_divisor_check
			break
		elsif number_to_check % divisor == 0
			return false
		end
	end
	LIST_OF_PRIMES << number_to_check
	return true
end


start = Time.now
max = 1000
puts quadratic_primes(max)
puts "Execution Time: #{Time.now - start}"
# Answer is -59231