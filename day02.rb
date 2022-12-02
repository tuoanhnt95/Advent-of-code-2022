# a rock, b paper, c scissor
# x rock 1p, y paper 2p, z scissor 3p
# lose 0, draw 3, win 6

file = File.read('rock-paper-scissors.txt')
array = file.split("\n")
p array[-1][2]

score_rules = [
  ["A","X",1,3],
  ["A","Y",2,6],
  ["A","Z",3,0],
  ["B","X",1,0],
  ["B","Y",2,3],
  ["B","Z",3,6],
  ["C","X",1,6],
  ["C","Y",2,0],
  ["C","Z",3,3],
]
score = 0

array.map do |group|
  # run through score_rule
  rule = score_rules.select { |rule| group[0] == rule[0] && group[2] == rule[1] }
  score += (rule[0][2] + rule[0][3])
end

p score
