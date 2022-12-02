file = File.read('rock-paper-scissors.txt')
array = file.split("\n")

# a rock, b paper, c scissors
# lose 0, draw 3, win 6

## -- First puzzle -- ##
# X rock 1p, X paper 2p, Z scissor 3p

## -- Second puzzle -- ##
# X lose, Y draw, Z win

round_rules = [
  ["A","rock",3],
  ["A","paper",6],
  ["A","scissors",0],
  ["B","rock",0],
  ["B","paper",3],
  ["B","scissors",6],
  ["C","rock",6],
  ["C","paper",0],
  ["C","scissors",3]
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
]

round_scores = [
  ["X", 0],
  ["Y", 3],
  ["Z", 6]
]

score = 0
score_two = 0

array.each do |group|
  # first puzzle
  shape = shape_symbols.find { |symbol| symbol[0] == group[2] }[1]
  round_score = round_rules.find { |rule| rule[0] == group[0] && rule[1] == shape }[2]
  shape_score = shape_rules.find { |rule| rule[0] == shape }[1]
  score += (round_score + shape_score)
  # second puzzle
  round_score_two = round_scores.find { |score| score[0] == group[2] }[1]
  shape_two = round_rules.find { |rule| rule[2] == round_score_two && rule[0] == group[0] }[1]
  shape_score_two = shape_rules.find { |rule| rule[0] == shape_two }[1]
  score_two += (round_score_two + shape_score_two)
end

p score
p score_two
