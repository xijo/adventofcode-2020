require 'fileutils'

class Seat
  attr_accessor :row, :col

  def initialize(string)
    @row = bsp(string[0, 7])
    @col = bsp(string[7, 3])
  end

  # binary space partitioning
  def bsp(chars)
    chars.gsub(/./, ?F => 0, ?B => 1, ?R => 1, ?L => 0).to_i(2)
  end

  def id
    row * 8 + col
  end
end

seats = File.read('input').each_line.map { |r| Seat.new(r.strip) }
seat_ids = seats.map(&:id)
puts "max id: #{seat_ids.max}\n\n"

puts "my seat: #{((seat_ids.min)..(seat_ids.max)).to_a - seat_ids}"
