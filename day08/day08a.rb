require 'fileutils'
require 'set'

input = File.read(File.join(__dir__, ARGV.first || 'input'))

instructions = input.split(?\n)
fp = 0           # function pointer
acc = 0
el = Set.new     # execution list

while el.add?(fp) do
  instruction = instructions[fp]
  operation, argument = instruction.split

  puts acc

  case operation
  when "nop"
    fp += 1
  when "acc"
    fp += 1
    acc += argument.to_i
  when "jmp"
    fp = fp + argument.to_i
  end
end
