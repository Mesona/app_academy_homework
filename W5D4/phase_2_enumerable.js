Array.prototype.myEach = function(callback) {
  for (i = 0; i < this.length; i++) {
    console.log(callback(this[i]));
  }
}

// let arr = [1, 2, -1, 0, 3, 0, -5, -2];
let arr = [12, 24, -5];
// arr.myEach( function(num) {
//   return num + num;
// });

Array.prototype.myMap = function(callback) {
  let result = [];
  this.myEach( function(el) {
    result.push(callback(el));
  });
  return result;
}

// arr.myMap(function (num) {
//   return num + num;
// });


Array.prototype.myReduce = function(callback, initialValue = 0) {
  let reduce = initialValue;
  this.myEach( function(el) {
    // debugger
    reduce = callback(reduce, el);
  });
  console.log(reduce);
}

arr.myReduce( function(acc, el){
  return acc + el;
});