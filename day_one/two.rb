file = File.read("input.txt").split("\n\n")

calories_per_elf = file.map do |l|
  l.split.map(&:to_i).reduce(:+)
end

puts calories_per_elf.sort.last(3).sum