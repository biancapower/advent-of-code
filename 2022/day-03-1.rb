require 'pry'

file = File.open("day-03-input.txt")
file_data = file.readlines.map{|l| l.strip.split('')}

items = []

file_data.each do |x|
  # find intersection of first half and second half
  items << x[0...x.length/2].intersection(x[x.length/2..-1])
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
