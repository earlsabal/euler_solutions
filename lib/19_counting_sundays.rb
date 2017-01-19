# Problem 19
# You are given the following information, 
# but you may prefer to do some research for yourself.
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, 
# but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the 
# twentieth century (1 Jan 1901 to 31 Dec 2000)?

WEEK_DAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
MONTHS_30_DAYS = ["April", "June", "September", "November"]
FIRST_YEAR = 1900
FOUR = 4
WEEK = 7
CENTURY = 100
FOUR_CENTURIES = 400
TWENTY_EIGHT_DAYS = 28
TWENTY_NINE_DAYS = 29
THIRTY_DAYS = 30
THIRTY_ONE_DAYS = 31

def counting_sundays(start_year, last_year)
	sundays = 0
	day_of_week = 0
	for year in FIRST_YEAR..last_year
		MONTHS.each do |month|
			day_of_week = check_first_day(year, month, day_of_week)
			if WEEK_DAYS[day_of_week] == "Sunday"
				if year > start_year
					sundays += 1
				end
			end
		end
	end
	return sundays
end

# Helper methods
def check_first_day(year, month, days)
	if month == "February"
		if check_leap_year(year) == true
			add_days = TWENTY_NINE_DAYS
		else
			add_days = TWENTY_EIGHT_DAYS
		end
	elsif MONTHS_30_DAYS.include?(month) == true
		add_days = THIRTY_DAYS
	else
		add_days = THIRTY_ONE_DAYS
	end
	days += add_days
	day = calculate_day(days)
	return day
end

def check_leap_year(year)
	leap_year = false
	if (year % FOUR == 0)
		if (year % CENTURY == 0) && (year % FOUR_CENTURIES != 0)
			leap_year == false
		else
			leap_year == true
		end
	else
		leap_year = false
	end
	return leap_year
end

def calculate_day(day)
	while day >= WEEK
		day -= WEEK
	end
	return day
end

start = Time.now
year_start = 1901
year_end = 2001
puts "Answer: #{counting_sundays(year_start, year_end)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 171