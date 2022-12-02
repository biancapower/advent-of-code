require 'pry'

file = File.open("day-02-input.txt")
file_data = file.readlines.map(&:strip)

=begin
A for Rock, B for Paper, and C for Scissors
1 for Rock, 2 for Paper, and 3 for Scissors
X for lose, Y for draw, and Z for win
=end

total_score = 0

rock = 1
paper = 2
scissors = 3

lose = {"A" => scissors, "B" => rock, "C" => paper}
draw = {"A" => rock, "B" => paper, "C" => scissors}
win = {"A" => paper, "B" => scissors, "C" => rock}

file_data.each do |match|
  position_score = match.include?("X") ? 0 : match.include?("Y") ? 3 : 6

  choice_score = position_score == 0 ? lose[match[0]] : position_score == 3 ? draw[match[0]] : win[match[0]]

  total_score += (choice_score + position_score)
end

p total_score
