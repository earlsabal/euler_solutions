# Problem 16
# 2**15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2**1000?

def power_digit_sum(number, exponent)
	product = number**exponent
	sum = generate_sum(product)
	return sum
end

# Helper methods
def generate_sum(number)
	sum = 0
	number = number.to_s
	numbers = number.split("")
	numbers.each do |integer|
		sum += integer.to_i
	end
	return sum
end

example_number = 2
example_exponent = 15
puts "Example Answer: #{power_digit_sum(example_number, example_exponent)}"
start = Time.now
number = 2
exponent = 1000
puts "Answer: #{power_digit_sum(number, exponent)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 1366