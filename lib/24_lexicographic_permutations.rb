# Problem 24
# A permutation is an ordered arrangement of objects.
# For example, 3124 is one possible permutation of the digits
# 1, 2, 3 and 4. If all of the permutations are listed numerically or
# alphabetically, we call it lexicographic order. The lexicographic
# permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# What is the millionth lexicographic permutation of the digits
# 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

def lexicographic_permutations(array_of_numbers, target_permutation)
	array_of_numbers = array_of_numbers.permutation
	array_of_numbers = array_of_numbers.to_a
	answer = array_of_numbers[target_permutation - 1].join
	return answer
end

start = Time.now
array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
target = 1000000
puts "Answer: #{lexicographic_permutations(array, target)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 2783915460