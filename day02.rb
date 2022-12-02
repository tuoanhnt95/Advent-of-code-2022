# a rock, b paper, c scissor
# x rock 1p, y paper 2p, z scissor 3p
# lose 0, draw 3, win 6

file = File.read('rock-paper-scissors.txt')
array = file.split("\n")

round_rules = [
  ["rock","rock",3],
  ["rock","paper",6],
  ["rock","scissors",0],
  ["paper","rock",0],
  ["paper","paper",3],
  ["paper","scissors",6],
  ["scissors","rock",6],
  ["scissors","paper",0],
  ["scissors","scissors",3]
]

shape_rules = [
  ["rock",1],
  ["paper",2],
  ["scissors",3]
]

shape_symbols = [
  ["X", 'rock'],
  ["Y", "paper"],
  ["Z", "scissors"],
  ["A", "rock"],
  ["B", "paper"],
  ["C", "scissors"]
]

score = 0

array.each do |group|
  symbol_one = shape_symbols.find { |symbol| symbol[0] == group[0] }[1]
  symbol_two = shape_symbols.find { |symbol| symbol[0] == group[2] }[1]
  round_rule = round_rules.find { |rule| rule[0] == symbol_one && rule[1] == symbol_two }
  shape_rule = shape_rules.find { |rule| rule[0] == symbol_two }
  score += (round_rule[2] + shape_rule[1])
end

p score

## -- Second round -- ##

# X lose, Y draw, Z win
# figure out the shape
# calculate the point
score_two = 0

round_scores = [
  ["X", 0],
  ["Y", 3],
  ["Z", 6]
]

array.each do |group|
  p group
  symbol_one = shape_symbols.find { |symbol| symbol[0] == group[0] }[1]
  round_score = round_scores.find { |score| score[0] == group[2] }[1]
  shape = round_rules.find { |rule| rule[2] == round_score && rule[0] == symbol_one }[1]
  p shape
  shape_rule = shape_rules.find { |rule| rule[0] == shape }
  score_two += (round_score + shape_rule[1])
end

p score_two
