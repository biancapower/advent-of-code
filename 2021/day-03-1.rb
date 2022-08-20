file = File.open('day-03-input.txt')
file_data = file.readlines.map(&:chomp)

transposed_data = file_data.map{|d| d.split('')}.transpose

gamma = ''
epsilon = ''

# for each item (array) in transposed_data
# 	more 0s than 1s 
# 		?
# 			gamma << "0" && epsilon << "1"
# 		: gamma << "1" && epsilon << "0"
transposed_data.each do |bit|
	bit.count("0") > bit.count("1") ? gamma << "0" && epsilon << "1" : gamma << "1" && epsilon << "0"
end

p gamma.to_i(2) * epsilon.to_i(2)