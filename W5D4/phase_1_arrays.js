Array.prototype.uniq = function() {
  let new_array = [];
  this.forEach(function(el) {
    if (! new_array.includes(el)) {
      new_array.push(el);
    }
  })

  return new_array;
}

Array.prototype.twoSum = function() {
  let results = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      if (i < j && this[i] + this[j] === 0) {
        results.push([i, j]);
      }
    }
  }

  return results;
}

// let arr = [1, 2, -1, 0, 3, 0, -5, -2];
// arr.twoSum();
// console.log(arr.twoSum());

let arr = [[1, 2, 3], [4, 5, 6]];

// [[1,4],
//  [2,5],
//  [3,6]]

Array.prototype.transpose = function() {
  let transposed_array = new Array([]);
  for (let i = 0; i < this[0].length; i++) {
    transposed_array[i] = [];
    for (let j = 0; j < this.length; j++) {
      // debugger;
      transposed_array[i].push(this[j][i]);
    }
  }

  return transposed_array;
}

console.log(arr.transpose())