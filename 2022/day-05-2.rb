require 'pry'

file = File.open("day-05-input.txt")
input = file.readlines

original_tower = input.first(8).map{|l| l.gsub(/    /, " [] ").strip.split}
instructions = input.select.with_index{|l, i| i > 9}.map{|l| l.gsub(/[a-zA-Z]+/, " ").strip.split.map(&:to_i)}

tower = {}

original_tower.transpose.each_with_index do |x, i|
  tower[i+1] = x.reverse.delete_if{|i| i == "[]"}
end

instructions.each do |i|
  move = i[0]
  from = i[1]
  to = i[2]

  tower[to] += tower[from].pop(move)
end

answer = ""

tower.each {|s| answer << s.last.last.gsub(/\[|\]/, "")}

p answer
