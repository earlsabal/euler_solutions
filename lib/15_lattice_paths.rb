# Problem 15
# Starting in the top left corner of a 2×2 grid, 
# and only being able to move to the right and down, 
# there are exactly 6 routes to the bottom right corner.
# (No picture provided)
# How many such routes are there through a 20×20 grid?
# How many such routes are there through a 20×20 grid?

GRID = Hash.new

def lattice_paths(x, y)
	 if x == 0 || y == 0
        return 1
    elsif x == 1 && y == 1
        return 2
    elsif GRID[[x,y]]
        return GRID[[x,y]]
    else
        GRID[[x,y]] = lattice_paths(x - 1, y) + lattice_paths(x, y - 1)
        return GRID[[x,y]]
    end
end

example_x, example_y = 2, 2
puts "Example Answer: #{lattice_paths(example_x, example_y)}"
start = Time.now
x, y = 20, 20
puts "Answer: #{lattice_paths(x, y)}"
puts "Execution Time: #{Time.now - start}"
# Answer is 137846528820