# Problem 9
# A Pythagorean triplet is a set of three natural numbers, a < b < c, 
# for which,
# a**2 + b**2 = c**2
# For example, 3**2 + 4**2 = 9 + 16 = 25 = 5**2.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def special_pythagorean_triplet(sum_of_a_b_c)
	for i in 1..sum_of_a_b_c
		a = i
		b = i + 1
		for j in b..sum_of_a_b_c			
			b = j
			c = Math.sqrt((a * a) + (b * b))
			if (a + b + c == sum_of_a_b_c)
				return a * b * c
			end
		end
	end
	return nil
end

start = Time.now
a_b_c_sum = 1000
puts "Answer: #{special_pythagorean_triplet(a_b_c_sum)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 31875000