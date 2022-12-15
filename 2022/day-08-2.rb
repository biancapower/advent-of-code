require 'pry'

file = File.open("day-08-input.txt")
file_data = file.readlines.map{|l| l.strip.split('')}

num_rows = file_data.count
num_cols = file_data[0].count

scenic_scores = []

def check(current, a)
  score = 0

  a.each do |i|
    score += 1
    if i >= current
      return score
    end
  end

  score
end

row = 0

while row < (num_rows) do
  col = 0

  while col < (num_cols) do
    current = file_data[row][col]

    left = file_data[row][0...col].reverse
    right = file_data[row][(col + 1)..-1]
    up = file_data.transpose[col][0...row].reverse
    down = file_data.transpose[col][(row + 1)..-1]

    scenic_scores << check(current, left) * check(current, right) * check(current, up) * check(current, down)

    col += 1
  end

  row += 1
end

p scenic_scores.max
