# frozen_string_literal: true

require 'pry'

def run
  file = File.read('input.txt').split("\n")

  duplicates =
    file.select do |f|
      one, two = f.split(/[\-,]/).each_slice(2).to_a
      range_one = range(one)
      range_two = range(two)

      true if (range_one - range_two).empty? || (range_two - range_one).empty?
    end

  puts "#{duplicates.count}"
end

def range(sections)
  sections.map!(&:to_i)
  (sections[0]..sections[1]).to_a
end

run
