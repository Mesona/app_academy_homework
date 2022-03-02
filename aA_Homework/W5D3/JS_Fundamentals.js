function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }

  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }

  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb, adjective, noun) {
  console.log('We shall ' + verb.toUpperCase() + ' the ' + 
    adjective.toUpperCase() + ' ' + noun.toUpperCase())
}
mysteryScoping1();
console.log('==========');
mysteryScoping2();
console.log('==========');
// mysteryScoping3();
console.log('==========');
mysteryScoping4();
console.log('==========');
// mysteryScoping5();
console.log('==========');
madLib('make', 'best', 'guac');


function isSubstring(searchString, subString) {
  if (searchString.includes(subString)) {
    console.log(true);
  } else {
    console.log(false);
  }
}

isSubstring("time to program", "time");
isSubstring("Jump for joy", "joys");

function fizzBuzz(arr) {
  let result = [];
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] % 3 === 0 && arr[i] % 5 != 0) {
      result.push(arr[i]);
    } else if (arr[i] % 5 === 0 && arr[i] %3 != 0) {
      result.push(arr[i]);
    } else {
      continue;
    }
  }
  console.log(result);
}

fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15]);

function isPrime(num) {
  let result = true;
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      result = false;
    }
  }
  console.log(result);
}

isPrime(2);
isPrime(4);

function sumOfNPrimes(n) {
  let result = [2];
  let i = 3;
  while (result.length < n) {
    console.log(result);
    if (isPrime(i)) {
      result.push(i);
    }
    i++;
  }
  var sum = result.reduce((a, b) => a + b, 0);
  console.log(sum);
}

// sumOfNPrimes(1);
// sumOfNPrimes(2);
// sumOfNPrimes(3);

function titleize(array_of_name, callback) {
  array_of_name.map(callback);
}

// tititleize(["Mary", "Brian", "Leo"], printCallback);