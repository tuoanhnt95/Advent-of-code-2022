file = File.read('rucksack.txt')
array = file.split("\n")

# -- Puzzle 1 --
score = 0
priority_score = [*('a'..'z').to_a, *('A'..'Z').to_a]

array.each do |rucksack|
  dep_one = rucksack[0, rucksack.length / 2].split('').uniq.join
  dep_two = rucksack[(rucksack.length / 2), rucksack.length - 1].split('').uniq.join

  dep_one.split('').each do |item|
    if dep_two[/#{item}/]
      score += priority_score.index(item) + 1
    end
  end
end

p score

# -- Puzzle 2 --
group_score = 0

groups = array.each_slice(3).to_a
groups.each do |group|
  uniq_rucksack_group = group.map do|rucksack|
    uniq_rucksack = rucksack.split('').uniq.join
  end
  join_group = uniq_rucksack_group.join
  counts = Hash.new 0
  join_group.each_char { |item| counts[item] += 1 }
  shared_item = join_group.split('').find { |item| counts[item] == 3 }
  group_score += priority_score.index(shared_item) + 1
end

p group_score
