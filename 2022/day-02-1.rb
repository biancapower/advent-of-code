require 'pry'

file = File.open("day-02-input.txt")
file_data = file.readlines.map(&:strip)

=begin
A for Rock, B for Paper, and C for Scissors
X for Rock, Y for Paper, and Z for Scissors
1 for Rock, 2 for Paper, and 3 for Scissors
rock = 1
paper = 2
scissors = 3
=end

total_score = 0

lose = ["A Z", "B X", "C Y"]
draw = ["A X", "B Y", "C Z"]
win = ["A Y", "B Z", "C X"]

file_data.each do |match|
  choice_score = match.include?("X") ? 1 : match.include?("Y") ? 2 : 3

  position_score = lose.include?(match) ? 0 : draw.include?(match) ? 3 : 6

  total_score += (choice_score + position_score)
end

p total_score
