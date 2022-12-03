require 'pry'

def response_map
  {
    "X" => "A",
    "Y" => "B",
    "Z" => "C"
  }
end

def win_map
  {
    "A" => "C",
    "B" => "A",
    "C" => "B"
  }
end

def choice_point_map
  {
    "A" => 1,
    "B" => 2,
    "C" => 3
  }
end

def match_point_map
  {
    "win" => 6,
    "tie" => 3,
    "loss" => 0
  }
end

def run
  file = File.read("input.txt").split("\n")
  arr = file.map{|f| f.split(" ")}

  total_pts = arr.sum do |m|
    opponent_move = m[0]
    response_move = response_map.fetch(m[1])
    result_points(opponent_move, response_move)
  end

  puts total_pts
end

def result_points(opponent_move, response_move)
  points = choice_point_map.fetch(response_move)

  result =
    if win_map.fetch(response_move) == opponent_move
      "win"
    elsif opponent_move == response_move
      "tie"
    else
      "loss"
    end

  points + match_point_map.fetch(result)
end

run