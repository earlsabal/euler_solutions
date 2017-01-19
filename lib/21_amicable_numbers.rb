# Problem 21
# Let d(n) be defined as the sum of proper divisors of 
# n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an 
# amicable pair and each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

def amicable_numbers(max)
	sum = 0
	for a in 0..max
		b = proper_divisors_sum(a)
		if (a != b) && (proper_divisors_sum(b) == a)
			sum += a
		end
	end
	return sum
end

# Helper method
def proper_divisors_sum(number)
	sum = 1
    (2..Math.sqrt(number)).each do |i|
      sum += number / i + i if number % i == 0
    end
    return sum
end

start = Time.now
numbers_below = 10000
puts "Answer: #{amicable_numbers(numbers_below)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 31626