require 'pry'

file = File.open("day-03-input.txt")
# split each line (string) into an array of characters
# create subarrays, each containing 3 arrays of chars (3 of the original 'lines')
file_data = file.readlines.map{|l| l.strip.split('')}.each_slice(3).to_a

items = []

file_data.each do |x|
  # find intersection of the three arrays
  items << x[0].intersection(x[1]).intersection(x[2])
end

=begin
"A" ->  "Z"
65  ->  90

"a" ->  "z"
97  ->  122
=end

items.map! do |i|
  # use char.sum to get ascii value
  s = i[0].sum
  s > 96 ? s - 96 : s - 38
end

p items.sum
