# frozen_string_literal: true

require 'pry'

def run
  input = File.read('input.txt').split("\n")
  groups = input.each_slice(3).to_a
  total_priority =
    groups.sum do |g|
      calculator(g)
    end

  puts total_priority
end

def calculator(group)
  one, two, three = group.map(&:chars)
  identical_item = one & two & three

  priority_map.index(identical_item.first).to_i
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
