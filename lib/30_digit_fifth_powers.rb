# Problem 30
# Surprisingly there are only three numbers that can be written as the
# sum of fourth powers of their digits:
# 1634 = 1**4 + 6**4 + 3**4 + 4**4
# 8208 = 8**4 + 2**4 + 0**4 + 8**4
# 9474 = 9**4 + 4**4 + 7**4 + 4**4
# As 1 = 14 is not a sum it is not included.
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
# Find the sum of all the numbers that can be written as the sum of fifth
# powers of their digits.

START_AT_TWO = 2

def digit_fifth_powers
	list_of_numbers = generate_list_of_numbers
	sum = find_sum(list_of_numbers, 1)
	return sum
end

# Helper methods
def generate_list_of_numbers
	list = []
	# max value of highest 5 digit number
	max = 9**5 * 5
	for i in START_AT_TWO..max
		number = i.to_s
		number = number.split("")
		sum = find_sum(number, 5)
		if sum == i
			list << i
		end
	end
	return list
end

def find_sum(array_of_numbers, power)
	sum = 0
	array_of_numbers.each do |number|
		sum += number.to_i**power
	end
	return sum
end


start = Time.now
puts "Answer: #{digit_fifth_powers}"
puts "Execution Time: #{Time.now - start}"
# Answer is 443839