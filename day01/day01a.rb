require 'fileutils'

input = File.read('input').each_line.map(&:to_i)

input.each do |a|
  input.each do |b|
    input.each do |c|
      puts a * b * c if (a + b + c == 2020)
    end
  end
end
