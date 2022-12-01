require 'pry'

file = File.open("day-01-input.txt")
file_data = file.readlines.map(&:to_i)

# array of arrays
total_cals = []

# temp variable to hold data
my_cals = []

file_data.each_with_index do |n, i|
  # if n != 0, append n to my_cals, else append my_cals to total_cals and reset my_cals
  (n != 0) ? (my_cals << n) : (total_cals << my_cals && my_cals = [])

  # handle final element
  total_cals << my_cals if file_data.length - 1 == i && !my_cals.empty?
end

# sum each sub-array, then sum largest 3 numbers
p total_cals.map(&:sum).sort.reverse[0..2].sum
