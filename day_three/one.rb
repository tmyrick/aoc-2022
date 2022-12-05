# frozen_string_literal: true

require 'pry'

def run
  file = File.read('input.txt').split("\n")

  total_priority =
    file.sum do |f|
      calculator(f)
    end

  puts total_priority
end

def calculator(contents)
  compartments = contents.chars.each_slice(contents.size / 2).to_a
  identical_item = compartments[0] & compartments[1]

  priority_map.index(identical_item.first)
end

def priority_map
  @priority_map ||=
    priority.concat(priority.map(&:upcase))
            .unshift('')
end

def priority
  @priority ||= ('a'..'z').to_a
end

run
