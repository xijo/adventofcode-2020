require 'fileutils'

grid = File.read('input').each_line.map { |line| line.strip.split('') }

def trees_on_slope(grid, right:, down:)
  offset = 0
  trees = 0
  width = grid.first.count

  grid.each_with_index do |line, line_index|
    next if line_index == 0
    next unless (line_index % down == 0)
    offset = (offset + right) % width
    trees += 1 if line[offset] == ?#
  end

  trees
end

puts trees_on_slope(grid, right: 1, down: 1)
puts trees_on_slope(grid, right: 3, down: 1)
puts trees_on_slope(grid, right: 5, down: 1)
puts trees_on_slope(grid, right: 7, down: 1)
puts trees_on_slope(grid, right: 1, down: 2)

puts [
  trees_on_slope(grid, right: 1, down: 1),
  trees_on_slope(grid, right: 3, down: 1),
  trees_on_slope(grid, right: 5, down: 1),
  trees_on_slope(grid, right: 7, down: 1),
  trees_on_slope(grid, right: 1, down: 2),
].inject(1, &:*)
