# frozen_string_literal: true

require 'pry'

def run(x)
  input = File.read('input.txt').split("\n").pop.chars
  current = input[0..x]
  count = x

  loop do
    break if current.uniq.count == x+1

    count += 1
    current = input[count-x..count]
  end
  puts count + 1
end

run(3)
run(13)