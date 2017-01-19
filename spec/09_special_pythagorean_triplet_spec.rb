require "09_special_pythagorean_triplet"

describe "Special pythagorean triplet" do
	it "finds the product of the special triplet" do
		expect(special_pythagorean_triplet(1000)).to eq(31875000)
	end
end