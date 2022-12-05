require 'pry'

def choice_point_map
  {
    "X" => 1,
    "Y" => 2,
    "Z" => 3
  }
end

def result_point_map
  {
    "X" => 0,
    "Y" => 3,
    "Z" => 6
  }
end

def win_map
  {
    "X" => "Y",
    "Y" => "Z",
    "Z" => "X"
  }
end

def lose_map
  {
    "X" => "Z",
    "Y" => "X",
    "Z" => "Y"
  }
end

def tie_map
  {
    "X" => "X",
    "Y" => "Y",
    "Z" => "Z"
  }
end

def response_map
  {
    "X" => "A",
    "Y" => "B",
    "Z" => "C"
  }
end

def result_map
  {
    "X" => lose_map,
    "Y" => tie_map,
    "Z" => win_map
  }
end

def run
  file = File.read("input.txt").split("\n")
  arr = file.map{|f| f.split(" ")}

  total_pts = arr.sum do |m|
    opponent_move = response_map.key(m[0])
    result = m[1]
    response_move = calculate_response(opponent_move, result)
    result_points(response_move, result)
  end

  puts total_pts
end

def calculate_response(opponent_move, result)
  mapped_result = result_map[result]

  mapped_result[opponent_move]
end

def result_points(response_move, result)
  move_points = choice_point_map.fetch(response_move)
  result_points = result_point_map.fetch(result)

  move_points + result_points
end

run