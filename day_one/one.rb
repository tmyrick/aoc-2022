file = File.read("input.txt").split("\n\n")

max = 0
file.map do |l|
  current = l.split.map(&:to_i).reduce(:+)
  max = current if current >= max
end

puts max