# frozen_string_literal: true

require 'pry'

def run
  file = File.read('input.txt').split("\n")

  overlappers =
    file.select do |f|
      one, two = f.split(/[\-,]/).each_slice(2).to_a
      range_one = range(one)
      range_two = range(two)

      calculate(range_one, range_two)
    end

  puts "#{overlappers.count}"
end

def calculate(x, y)
  merged_array = x + y
  total_sections = merged_array.count
  unique_sections = merged_array.uniq.count

  true if total_sections != unique_sections
end

def range(sections)
  sections.map!(&:to_i)
  (sections[0]..sections[1]).to_a
end

run

