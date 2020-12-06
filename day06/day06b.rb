require 'fileutils'

puts(File.read('input').split("\n\n").map { |g| g.split(?\n).map(&:chars).inject(:&).size }.inject(&:+))
