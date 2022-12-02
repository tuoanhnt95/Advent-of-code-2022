#
require "open-uri"
require "nokogiri"
require "http"

url = "https://adventofcode.com/2022/day/1/input"
file = File.read("calories.txt")
array = file.split("\n\n")

new_array = array.map do |group|
  group.split("\n").map do |number|
    number.to_i
  end.sum
end

p "Array with #{new_array.length} groups."
# First question: Total calories carried by the elf with the most calories of food?
p new_array.max

# Second question: Top 3 heaviest calories elf loaders
sort_sums = new_array.sort
p sort_sums[-1] + sort_sums[-2] + sort_sums[-3]
