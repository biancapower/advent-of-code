file = File.open("day-02-input.txt")
file_data = file.readlines.map{ |line| line.chomp.split(' ') }
													.map{|a| [a[0], a[1].to_i]}

horizontal_position = 0
depth = 0
aim = 0

file_data.each do |arr|
	k = arr[0]
	v = arr[1]

	case k
	when "forward"
		horizontal_position += v
		depth += aim * v
	when "down"
		aim += v
	when "up"
		aim -= v
	end
end

p horizontal_position * depth