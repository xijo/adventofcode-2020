require 'fileutils'

tree = {}

puts ARGV.first || 'input'

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

def bag_count(bag, tree)
  return 1 if tree[bag].keys.empty?

  tree[bag].inject(1) do |i, (k, v)|
    i + (bag_count(k, tree) * v)
  end
end

puts bag_count('shiny gold', tree) - 1
