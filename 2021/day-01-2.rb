file = File.open("day-01-input.txt")
file_data = file.readlines.map(&:to_i)

count = 0

# creates consecutive pairs `.each_cons(2)` 
# 	of consecutive triplets	`.each_cons(3)`
# 		e.g.
# 			[[3273, 3277, 3273], [3277, 3273, 3271]]
# 			[[3277, 3273, 3271], [3273, 3271, 3274]]
# 			[[3273, 3271, 3274], [3271, 3274, 3275]]
# 			[[3271, 3274, 3275], [3274, 3275, 3273]]
file_data.each_cons(3).each_cons(2) { |pair| count += 1 if pair[1].sum > pair[0].sum }

puts count