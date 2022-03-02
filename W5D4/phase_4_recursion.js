range = function(start, end) {
  // debugger
  let result = [];
  if (start === end) {
    result = result.concat(start);
    return result;
  }
   else {
    result = result.concat(start, range(start + 1, end));
  }
  return result;
};

range(1,5);

sumRec = function(arr) {
  let sum = 0;
  // debugger;
  if (arr.length === 1) {
    return arr[0];
  } else {
    sum += (arr[0] + sumRec(arr.slice(1)));
  }

  return sum;
}

arr = [1, 2, 3, 4];
sumRec(arr);

exponent = function (base, exp) {
  let result = base;
  // debugger;
  if (exp === 0) {
    return 1;
  } else {
    result = (base * exponent(base, exp - 1));
  }

  return result;
}

// exponent(10, 0);
// exponent(10, 2);

exponent2 = function (base, exp) {
  let result = base;
  // debugger;
  if (exp === 0) {
    return 1;
  } else if (exp === 1 ) {
    return base;
  } else if (exp % 2 === 0) {
    result = (exponent(base, exp / 2) ** 2);
  } else {
    result = (base * exponent(base, (exp - 1) / 2) ** 2);
  }

  return result;
}


fib = function(num) {
  let result = [];
  if (num === 1) {
    return result = [1];
  } else if (num === 2) {
    return result = [1, 1];
  } else {
    // debugger
    result = result.concat(fib(num - 1));
    result = result.concat(result[result.length - 2] + result[result.length-1]);
  }
  return result;
}

deepDup = function(arr) {
  let result = [];
  arr.forEach( function(el) {
    if (Array.isArray(el)) {
      result = result.concat([deepDup(el)]);
    } else {
      result = result.concat(el);
    }
  });
  return result;
}

bsearch = function(arr, target) {
  let middle = Math.floor(arr.length / 2);
  // debugger
  if (target === arr[middle]) {
    return middle;
  } else if (arr.length === 1 && target !== arr[middle] ) {
    return -1;
  } else if (target < arr[middle] ) {
    return bsearch(arr.slice(0, middle), target);
  } else {
    // return (bsearch(arr.slice(middle + 1), target) + middle + 1);
    const right = (bsearch(arr.slice(middle + 1), target));
    return right === -1 ? -1 : right + (middle + 1);
  }
}