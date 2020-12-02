require 'fileutils'

valid = File.read('input').each_line.select do |line|
  line =~ /(\d+)\-(\d+) ([a-z]): ([a-z]+)/
  min, max, char, pass = $1.to_i, $2.to_i, $3, $4
  (min..max).include?(pass.count(char))
end

puts valid.count
