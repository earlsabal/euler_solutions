# Problem 17
# If the numbers 1 to 5 are written out in words: 
# one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 
# letters used in total.
# If all the numbers from 1 to 1000 (one thousand) inclusive were 
# written out in words, how many letters would be used?
# NOTE: Do not count spaces or hyphens. For example, 
# 342 (three hundred and forty-two) contains 23 letters and 
# 115 (one hundred and fifteen) contains 20 letters. The use of "and" 
# when writing out numbers is in compliance with British usage.

TEN = 						10
ONE_HUNDRED = 				100
ONE_THOUSAND = 				1000
ONE_MILLION = 				1000000
ONE_BILLION = 				1000000000
ONE_TRILLION =				1000000000000
ONE_QUADRILLION =			1000000000000000

ONES = {0 => "", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
TEENS = {10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}
TENS = {2 => "twenty", 3 => "thirty", 4 => "forty", 5 => "fifty", 6 => "sixty", 7 => "seventy", 8 => "eighty", 9 => "ninety"}		

def number_letter_counts(start, last)
	number_of_letters = 0
	for i in start..last
		string = generate_string(i)
		number_of_letters += generate_letter_count(string)
	end
	return number_of_letters
end

# Helper methods
def generate_string(number)
	string = ""
	while number > 0
			numbers = number.to_s.split("")
			num = numbers[0].to_i			
			if string != ""
				string += " "
			end

			if number < 10
				string += ONES[number]
				number -= number
			elsif number < 100
				if number < 20
					string += TEENS[number]
					number -= number
				else
					string += TENS[num]
					number = new_num(numbers)
				end
			elsif number < ONE_THOUSAND
				digit_string, number = convert_digit_to_string(number, numbers, "hundred")
				string += digit_string
			elsif number < ONE_MILLION
				digit_string, number = convert_digit_to_string(number, ONE_THOUSAND, "thousand")
				string += digit_string
			elsif number < ONE_BILLION
				digit_string, number = convert_digit_to_string(number, ONE_MILLION, "million")
				string += digit_string
			elsif number < ONE_TRILLION
				digit_string, number = convert_digit_to_string(number, ONE_BILLION, "billion")
				string += digit_string
			elsif number < ONE_QUADRILLION
				digit_string, number = convert_digit_to_string(number, ONE_TRILLION, "trillion")
				string += digit
			end
	end
	if string == ""
		string = "zero"
	end
	return string
end

def new_num(nums)
	nums.shift
	return nums.join("").to_i
end

def generate_letter_count(string)
	string = string.split(" ")
	string = string.join("")
	return string.length
end

def convert_digit_to_string(number, digit, word)
	if number < ONE_THOUSAND
		string = ONES[digit[0].to_i] + " #{word}"
		number = new_num(digit)
	else
		num = number / digit
		string = generate_string(num) + " #{word}"
		number -= num * digit
	end
	
	if number > 0
		string += " and"
	end
	
	return string, number
end


start = Time.now
puts number_letter_counts(1, 1000)
puts "Execution Time: #{Time.now - start}"
# Answer is 21124