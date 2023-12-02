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

# p score
# p score_two

books = [
  "How to talk to Anyone",
  "Atomic Habits",
  "Rich Dad Poor Dad",
  "The 5-AM Club",
  "Thinking, Fast and Slow",
  "The 48 Laws of Power",
  "Make Your Bed",
  "The Subtle Art of Not Caring",
  "How to Win Friends and Influence People",
  "Think and Grow Rich",
  "The Power of Habit",
  "The 7 Habits of Highly Effective People",
  "The Power of Positive Thinking",
  "12 Rules for Life",
  "The 80/20 Principle",
  "The 4-hour body",
  "Never Get a Real Job",
  "Quiet",
  "Girl, Stop Apologizing",
  "Girl, Wash Your Face",
  "How to Stop Worrying and Start Living",
  "Act like a Lady, Think like a man",
  "Talking to Strangers",
  "Deep Work",
  "The Four Agreements",
  "The 5 Love Languages",
  "Getting Things Done",
  "Who Moved My Cheese?",
  "The 4-Hour Workweek",
  "The Power of Now"
]

# split by space
# count the words
# detect all the words

less_than3 = []
words3 = []
words4 = []
words5 = []
more_than5 = []
includes_number = []
includes_how_to = []
starts_with_the = []
includes_you_or_your = []

books.each do |book|
  number_of_words = book.split(" ").count
  # p book + " has " + number_of_words.to_s + " words."
  case number_of_words
  when 1..2
    less_than3 << book
  when 3
    words3 << book
  when 4
    words4 << book
  when 5
    words5 << book
  else
    more_than5 << book
  end
  if book.match?(/\d/)
    includes_number << book
  end
  if book.match?(/how to/i)
    includes_how_to << book
  end
  if book.match?(/\Athe/i)
    starts_with_the << book
  end
  if book.match?(/you|your/i)
    includes_you_or_your << book
  end
end

p less_than3.count.to_s + ' books (' + (less_than3.count*100/30).to_s  + '%) have less than 3 words.'
p words3.count.to_s + ' books (' + (words3.count*100/30).to_s  + '%) have 3 words.'
p words4.count.to_s + ' books (' + (words4.count*100/30).to_s  + '%) have 4 words.'
p words5.count.to_s + ' books (' + (words5.count*100/30).to_s  + '%) have 5 words.'
p more_than5.count.to_s + ' books (' + (more_than5.count*100/30).to_s  + '%) have more than 5 words.'
p includes_number.count.to_s + ' books (' + (includes_number.count*100/30).to_s  + '%) include a number.'
p includes_how_to.count.to_s + ' books (' + (includes_how_to.count*100/30).to_s  + '%) include "how to".'
p starts_with_the.count.to_s + ' books (' + (starts_with_the.count*100/30).to_s  + '%) start with "the".'
p includes_how_to.count.to_s + ' books (' + (includes_how_to.count*100/30).to_s  + '%) include "how to".'
p includes_you_or_your.count.to_s + ' books (' + (includes_you_or_your.count*100/30).to_s  + '%) include "you" or "your".'
