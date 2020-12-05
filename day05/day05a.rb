require 'fileutils'

# Ignore odd case
class Range
  def lower
    (min..(min - 1 + size / 2))
  end

  def upper
    ((size / 2 + min)..max)
  end
end

class Seat
  attr_accessor :row, :col

  def initialize(string)
    @row = string.chars.first(7).inject(0..127) { |r, c| c == ?F ? r.lower : r.upper }.min
    @col = string.chars.last(3).inject(0..7) { |r, c| c == ?L ? r.lower : r.upper }.min
  end

  def id
    row * 8 + col
  end
end

seats = File.read('input').each_line.map { |r| Seat.new(r.strip) }
seat_ids = seats.map(&:id)
puts "max id: #{seat_ids.max}\n\n"

puts "my seat: #{((seat_ids.min)..(seat_ids.max)).to_a - seat_ids}"
