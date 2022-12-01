require 'pry'

file = File.open("day-01-input.txt")
file_data = file.readlines.map(&:to_i)

total_cals = []
my_cals = []

file_data.each_with_index do |n, i|
  (n != 0) ? (my_cals << n) : (total_cals << my_cals && my_cals = [])

  total_cals << my_cals if file_data.length - 1 == i && !my_cals.empty?
end

p total_cals.map(&:sum).max
