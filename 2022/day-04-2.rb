require 'pry'

file = File.open("day-04-input.txt")
file_data = file.readlines.map{|l| l.chomp.split(',')}

count = 0

file_data.each do |a|
  pair_one = Range.new(*a[0].split("-").map(&:to_i))
  pair_two = Range.new(*a[1].split("-").map(&:to_i))

  count += 1 if pair_one.any?{|n| pair_two.include? n}
end

p count
