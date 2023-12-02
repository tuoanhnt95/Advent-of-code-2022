const { readFileSync, promise: fsPromises } = require('fs');

function syncReadFile(filename) {
    const contents = readFileSync(filename, 'utf-8');
    const arr = contents.split(/\r?\n/);
    return arr;
}

const arr_stack = syncReadFile('crate_stacks.txt')
arr_stack.splice(arr_stack.length - 1, 1);
let stacks = arr_stack.map(stack => stack.split(''));

const arr_inst = syncReadFile('crate_instructions.txt')
arr_inst.splice(arr_inst.length - 1, 1);;
const regEx = /move (\d)+ from (\d)+ to (\d)/;
const insts = arr_inst.map(ints => ints.replace(regEx, '$1, $2, $3')
    .split(',').map(num => +num));
//console.log(insts);

function moveCrate(inst) {
    const from_stack = stacks[inst[1] - 1];
    const to_stack = stacks[inst[2] - 1];
    to_stack.unshift(...from_stack.splice(0,inst[0]).reverse());
}

// console.log(stacks);
for (let inst of insts) {
    moveCrate(inst)
}

console.log(stacks);
