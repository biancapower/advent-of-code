require 'pry'

file = File.open("day-08-input.txt")
file_data = file.readlines.map{|l| l.strip.split('')}

num_rows = file_data.count
num_cols = file_data[0].count

num_edge_trees = (num_cols + num_rows - 2) * 2
num_inner_trees = 0

row = 1

while row < (num_rows - 1) do
  col = 1

  while col < (num_cols - 1) do
    current = file_data[row][col]
    check_left = file_data[row][0..col].tally[current] == 1 && file_data[row][0..col].max == current
    check_up = file_data.transpose[col][0..row].tally[current] == 1 && file_data.transpose[col][0..row].max == current
    check_right = file_data[row][col..-1].tally[current] == 1 && file_data[row][col..-1].max == current
    check_down = file_data.transpose[col][row..-1].tally[current] == 1 && file_data.transpose[col][row..-1].max == current

    num_inner_trees += 1 if check_left || check_right || check_up || check_down

    col += 1
  end

  row += 1
end

p num_edge_trees + num_inner_trees
