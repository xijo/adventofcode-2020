require 'fileutils'

grid = File.read('input').each_line.map { |line| line.strip.split('') }

puts grid.inspect

# current_line = 0
offset = 0
trees = 0

width = grid.first.count

grid[1..-1].each do |line|
  offset = (offset + 3) % width
  puts line.join
  puts offset.to_s.rjust(offset, ' ')
  puts line[offset].rjust(offset, ' ')
  trees += 1 if line[offset] == ?#
  # line
end

puts trees
