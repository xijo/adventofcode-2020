require 'fileutils'
require 'set'

input = File.read(File.join(__dir__, ARGV.first || 'input'))

window = 25
numbers = input.split(?\n).map(&:to_i)

(window...numbers.size).each do |i|
  inspect = numbers[i-window, window]
  unless inspect.permutation(2).any? { |p| p.sum == numbers[i] }
    puts "attack vector: #{numbers[i]}"
  end
end
