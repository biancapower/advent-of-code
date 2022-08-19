file = File.open("day-01-input.txt")
file_data = file.readlines.map(&:to_i)

count = 0

# each_cons(2) creates consecutive pairs
file_data.each_cons(2) { |pair| count += 1 if pair[1] > pair[0] }

puts count