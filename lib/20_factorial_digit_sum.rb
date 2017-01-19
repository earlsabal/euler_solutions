# Problem 20
# n! means n × (n − 1) × ... × 3 × 2 × 1
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is
# 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
# Find the sum of the digits in the number 100!

def factorial_digit_sum(number)
	factorial_product = find_factorial(number)
	digit_sum = find_digit_sum(factorial_product.to_s)
	return digit_sum
end

# Helper methods
def find_factorial(number)
	product = 1
	for i in 0...number
		product *= number
		number -= 1
	end
	return product
end

def find_digit_sum(number)
	sum = 0
	numbers = number.split("")
	numbers.each do |digit|
		sum += digit.to_i
	end
	return sum
end

example_factorial = 10
puts "Example Answer: #{factorial_digit_sum(example_factorial)}"
start = Time.now
factorial = 100
puts "Answer: #{factorial_digit_sum(factorial)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 648