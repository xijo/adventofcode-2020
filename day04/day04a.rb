require 'fileutils'

class Passport
  attr_accessor :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid

  def initialize(string)
    string.split(/\s+/).each do |part|
      key, value = part.split(?:)
      __send__(:"#{key}=", value)
    end
  end

  # rigged, cid is missing
  def complete?
    [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid].all? { |f| !!__send__(f) }
  end

  def valid?
    # all fields are present
    complete? or return false

    # byr (Birth Year) - four digits; at least 1920 and at most 2002.
    (1920..2002).include?(byr.to_i) or return false

    # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
    (2010..2020).include?(iyr.to_i) or return false

    # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
    (2020..2030).include?(eyr.to_i) or return false

    # hgt (Height) - a number followed by either cm or in:
    #     If cm, the number must be at least 150 and at most 193.
    #     If in, the number must be at least 59 and at most 76.
    if hgt.end_with?('cm')
      (150..193).include?(hgt.to_i) or return false
    elsif hgt.end_with?('in')
      (59..76).include?(hgt.to_i) or return false
    else
      return false
    end

    # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
    hcl.match?(/\A#[0-9a-f]{0,9}\z/) or return false

    # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
    %w[amb blu brn gry grn hzl oth].include?(ecl) or return false

    # pid (Passport ID) - a nine-digit number, including leading zeroes.
    pid.match?(/\A\d{9}\z/) or return false

    # cid (Country ID) - ignored, missing or not.
  end
end

puts File.read('input').split("\n\n").map { |p| Passport.new(p) }.count &:complete?
puts File.read('input').split("\n\n").map { |p| Passport.new(p) }.count &:valid?
