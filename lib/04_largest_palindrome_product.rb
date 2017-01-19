# Problem 4
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 
# 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

LARGEST_ONE_DIGIT_NUMBER = 9

def largest_palindrome_product(number_of_digits)
	largest_number_to_mulitply = generate_largest_number(number_of_digits)
	list_of_palindromes = generate_palindrome_list(largest_number_to_mulitply)
	largest_palindrome = list_of_palindromes.sort.last
	return largest_palindrome 
end

# Helper methods
def generate_largest_number(number_of_digits)
	large_number = []
	while large_number.size < number_of_digits
		large_number << LARGEST_ONE_DIGIT_NUMBER
	end
	return large_number.join("").to_i
end

def generate_palindrome_list(number)
	list = []
	first_multiple = number
	while first_multiple > 0
		second_multiple = first_multiple
		while second_multiple > 0
			product = first_multiple * second_multiple
			if palindrome_check(product) == true
				list << product
			end
			second_multiple -= 1
		end
		first_multiple -= 1
	end
	return list
end

def palindrome_check(number)
	number = number.to_s
	if number == number.reverse
		return true
	else
		return false
	end
end

example_test_digits = 2
puts "Example Answer: #{largest_palindrome_product(example_test_digits)}"
start = Time.now
test_digits = 3
puts "Answer: #{largest_palindrome_product(test_digits)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 906609