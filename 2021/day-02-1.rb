file = File.open("day-02-input.txt")
file_data = file.readlines.map(&:chomp) 							# gets each line and discards \n
													.map{|arr| arr.split(' ')} 	# split direction from amount
													.map{|a| [a[0], a[1].to_i]}	# convert amount to int

horizontal_position = 0
depth = 0

file_data.each do |arr|
	k = arr[0]
	v = arr[1]

	case k
	when "forward"
		horizontal_position += v
	when "down"
		depth += v
	when "up"
		depth -= v
	end
end

p horizontal_position * depth