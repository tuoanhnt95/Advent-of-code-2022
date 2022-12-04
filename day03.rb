file = File.read('rucksack.txt')
array = file.split("\n")

score = 0

lowcase_score = [*('a'..'z').to_a, *('A'..'Z').to_a]

array.each do |rucksack|
  dep_one = rucksack[0, rucksack.length / 2].split('').uniq.join
  dep_two = rucksack[(rucksack.length / 2), rucksack.length - 1].split('').uniq.join

  dep_one.split('').each do |item|
    if dep_two[/#{item}/]
      score += lowcase_score.index(item) + 1
    end
  end
end

p score


