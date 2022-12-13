require 'pry'

file = File.open("day-07-input.txt")
file_data = file.readlines.map(&:strip)

current_dirs = ["/"]
data = {"/" => {val: 0, dir_structure: ["/"]}}
nums = (1..100).to_a

file_data.each do |l|
  # if a `cd` command, take the second capture group
  #   and store it as a key in `data`, with value = 0
  cd_cmd = l.match(/(\$\ cd\ )([a-zA-Z]+)/)
  if cd_cmd
    dir = cd_cmd[2]

    # if the key exists, don't double up
    if data[dir]
      dir = dir + nums[-1].to_s
      nums.pop
    end

    data[dir] = {val: 0, dir_structure: current_dirs.clone}

    current_dirs << dir
  end

  cd_back = l.match(/(\$\ cd\ )(\.\.)/)
  if cd_back
    current_dirs.pop
  end

  file_size = l.match(/(\d+) ([a-zA-Z.]+)/)
  if file_size
    current_dirs.each {|d| data[d][:val] += file_size[1].to_i}
  end
end

free_space = 70000000 - data["/"][:val]
space_needed = 30000000 - free_space

vals = data.values.select{|n| n[:val] >= space_needed}.map{|v| v[:val]}

p vals.min
