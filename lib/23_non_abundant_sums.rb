# Problem 23
# A perfect number is a number for which the sum of its proper divisors
# is exactly equal to the number. For example, the sum of the proper
# divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is
# a perfect number.
# A number n is called deficient if the sum of its proper divisors is
# less than n and it is called abundant if this sum exceeds n.
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16,
# the smallest number that can be written as the sum of two abundant
# numbers is 24. By mathematical analysis, it can be shown that all
# integers greater than 28123 can be written as the sum of two abundant
# numbers. However, this upper limit cannot be reduced any further by
# analysis even though it is known that the greatest number that cannot
# be expressed as the sum of two abundant numbers is less than this limit.
# Find the sum of all the positive integers which cannot be written as
# the sum of two abundant numbers.

MAX_NUMBER = 28123
SMALLEST_ABUNDANT_NUMBER = 12
SMALLEST_POSSIBLE_ABUNDANT_SUM = 24
SMALLEST_DIVISOR = 1

ABUNDANT_NUMBERS = [SMALLEST_ABUNDANT_NUMBER]
POSSIBLE_ABUNDANT_SUMS = {SMALLEST_POSSIBLE_ABUNDANT_SUM => nil}

def non_abundant_sums
    while ABUNDANT_NUMBERS.last < MAX_NUMBER
        ABUNDANT_NUMBERS << find_next_abundant(ABUNDANT_NUMBERS)
        ABUNDANT_NUMBERS.each do |number|
            sum = ABUNDANT_NUMBERS.last + number
            if sum > MAX_NUMBER
                break
            end
            POSSIBLE_ABUNDANT_SUMS.store(sum, nil)
        end 
    end
    total_sum = calculate_total_sum
    return total_sum
end

# Helper methods
def sum_of_proper_divisors(a_number)
    sum = SMALLEST_DIVISOR
    max = Math.sqrt(a_number)
    for i in 2..max
        if a_number % i == 0
            result = a_number / i
            if result != i
                sum += result
            end
        sum += i
        end
    end
    return sum
end

def find_next_abundant(abundant_numbers)
    next_abundant = abundant_numbers.last + 1
    while sum_of_proper_divisors(next_abundant) <= next_abundant
        next_abundant += 1;
    end
    return next_abundant
end

def calculate_total_sum
    sum = 0
    for i in 0..MAX_NUMBER
        if POSSIBLE_ABUNDANT_SUMS.include?(i) == false
            sum += i
        end
    end
    return sum
end

start = Time.now
puts "Answer: #{non_abundant_sums}"
puts "Execution Time: #{Time.now - start}"
# Answer is 4179871