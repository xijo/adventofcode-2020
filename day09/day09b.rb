require 'fileutils'
require 'set'

input = File.read(File.join(__dir__, ARGV.first || 'input'))

numbers = input.split(?\n).map(&:to_i)
vector = 27911108
# vector = 127

(0...numbers.size).each do |start|
  pointer = start
  sum = 0
  while sum < vector do
    sum += numbers[pointer]

    if sum == vector
      range = numbers[start..pointer]
      puts "min: #{range.min} max: #{range.max} sum: #{range.min + range.max}" if sum == vector
    end
    pointer += 1
  end
end
