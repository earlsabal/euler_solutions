require "10_summation_of_primes"

describe "Summation of primes" do
	it "finds the sum of all primes below 10" do
		expect(summation_of_primes(10)).to eq(17)
	end

	it "finds the sum of all primes below 2,000,000" do
		expect(summation_of_primes(2000000)).to eq(142913828922)
	end
end