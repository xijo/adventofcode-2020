require 'fileutils'

valid = File.read('input').each_line.select do |line|
  line =~ /(\d+)\-(\d+) ([a-z]): ([a-z]+)/
  pos1, pos2, char, pass = $1.to_i, $2.to_i, $3, $4
  [pass[pos1 - 1], pass[pos2 - 1]].join.count(char) == 1
end

puts valid.count
