require 'fileutils'

puts File.read('input').split("\n\n").map { |g| g.gsub(?\n, '').split('').uniq.size }.inject(&:+)
