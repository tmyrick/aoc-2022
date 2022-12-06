# frozen_string_literal: true

require 'pry'

def run
  input = File.read('input.txt').split("\n").pop.chars
  current = input[0..3]
  count = 3

  loop do
    break if current.uniq.count == 4

    count += 1
    current = input[count-3..count]
  end
  puts count + 1
end

run
