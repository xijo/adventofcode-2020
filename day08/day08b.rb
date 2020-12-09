require 'fileutils'
require 'set'

input = File.read(File.join(__dir__, ARGV.first || 'input'))

instructions = input.split(?\n)

nop_positions, jmp_positions = [], []

instructions.each_with_index do |instruction, i|
  nop_positions << i if instruction.start_with?("nop")
  jmp_positions << i if instruction.start_with?("jmp")
end

def test_is(is)
  fp = 0           # function pointer
  acc = 0
  el = Set.new     # execution list

  while el.add?(fp) do
    instruction = is[fp]
    if fp == is.size
      puts acc
      return
    end

    operation, argument = instruction.split

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
end

(nop_positions + jmp_positions).each do |pos|
  is = instructions.dup # instruction set
  is[pos] = is[pos].gsub(/nop|jmp/, 'nop' => 'jmp', 'jmp' => 'nop')
  test_is(is)
  # puts instruction_set.count
end
