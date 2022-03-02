Array.prototype.bubbleSort = function() {
  let sorted = false;
  let sorted_array = this;
  while (sorted === false) {
    sorted = true;
    for (let i = 0; i < (sorted_array.length - 1); i++) {
      if (sorted_array[i] > sorted_array[i + 1]) {
        let first = sorted_array[i];
        sorted_array[i] = sorted_array[i + 1];
        sorted_array[i + 1] = first;
        sorted = false;
        console.log(sorted_array);
      }
    }
  }

  console.log(sorted_array);
}

let arr = [1, 2, -1, 0, 3, 0, -5, -2];
// arr.bubbleSort();

String.prototype.substrings = function() {
  let substrings = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }

  return substrings;
}

str = "A String";
str.substrings();