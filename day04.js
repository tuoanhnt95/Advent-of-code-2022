const {readFileSync, promises: fsPromises} = require('fs');

function syncReadFile(filename) {
  const contents = readFileSync(filename, 'utf-8');
  const arr = contents.split(/\r?\n/);
  return arr;
}

const arr = syncReadFile('./sections.txt')
// arr.splice(1000, 1);
arr.splice(arr.length - 1, 1);
console.log(arr.length);

// split into two by ","
let pair_sections = arr.map(elf_section => elf_section.split(',')
// split into first and last section by "-"
.map(section => section.split('-')
.map(start => +start))
);

// find if the first = first && last = last or (first - first).(last - last) < 0
let contain_pairs = 0;

function checkContain(pair_section) {
  if (!((
    (pair_section[0][0] - pair_section[1][0])
    *
    (pair_section[0][1] - pair_section[1][1]))
    > 0)) { contain_pairs += 1 }
}

pair_sections.forEach(pair_section => checkContain(pair_section));
console.log(contain_pairs);

let overlap_pairs = 0;
function checkOverlap(pair_section) {
  // find if there is any overlap
  if (((
    (pair_section[0][0] - pair_section[1][0])
    *
    (pair_section[0][1] - pair_section[1][0]))
    > 0)) {
      console.log(pair_section);
      overlap_pairs }
  else if ((
    ((pair_section[0][0] - pair_section[1][1])
    *
    (pair_section[0][1] - pair_section[1][1]))
    > 0)) {
      console.log(pair_section);
      overlap_pairs }
  else {overlap_pairs += 1};
}

pair_sections.forEach(pair_section => checkOverlap(pair_section));
console.log(arr.length - overlap_pairs);
