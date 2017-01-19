# Problem 26
#A unit fraction contains 1 in the numerator. The decimal representation
# of the unit fractions with denominators 2 to 10 are given:
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
# It can be seen that 1/7 has a 6-digit recurring cycle.
# Find the value of d < 1000 for which 1/d contains the
# longest recurring cycle in its decimal fraction part.

STARTING_DENOMINATOR = 2

def reciprocal_cycles(max_number)
	denominator = 0
	biggest_cycle_length = 0
	for current_denominator in STARTING_DENOMINATOR..max_number
		recurring_cycle_length = recurring_cycles(current_denominator)
		if recurring_cycle_length > biggest_cycle_length
			biggest_cycle_length, denominator = recurring_cycle_length, current_denominator
		end
	end
	return denominator
end

# Helper method
def recurring_cycles(current_denominator)
	if (current_denominator % 2 ==0) || (current_denominator % 5 == 0)
		length = 0
	else
		length = 1
		while (((10**length) - 1) % current_denominator) != 0
			length += 1
		end
	end
	return length
end

example_below_number = 11
puts "Example Answer: #{reciprocal_cycles(example_below_number)}"
start = Time.now
below_number = 1000
puts "Answer: #{reciprocal_cycles(below_number)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 983