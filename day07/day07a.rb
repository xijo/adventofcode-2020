require 'fileutils'

tree = {}

File.read('day07/input').each_line do |line|
  bag = line[/\A\w+\s\w+/]
  tree[bag] = {}

  if line.end_with?('contain no other bags')
  else
    line.scan(/(\d+\s\w+\s\w+)/).each do |match|
      tree[bag][match.first[/\w+\s\w+\z/]] = match.first[/\d+/].to_i
    end
  end
end

def contains_shiny_gold?(bag, tree)
  return true if tree[bag].keys.include?('shiny gold')
  return false if tree[bag].keys.empty?

  tree[bag].keys.any? { |i| contains_shiny_gold?(i, tree) }
end

puts tree.keys.select { |i| contains_shiny_gold?(i, tree) }.size
