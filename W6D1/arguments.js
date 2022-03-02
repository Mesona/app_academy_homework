// Sum
function sum(...args) {
    let result = 0;
    for (let i = 0; i < args.length; i++) {
        result += args[i];
    }
    // args.reduce(function(acc, el) {
    //     return acc + el;
    // }, first);
    return result;
}

// myBind

// class Cat {
//     constructor(name) {
//       this.name = name;
//     }
    
//     says(sound, person) {
//         console.log(`${this.name} says ${sound} to ${person}!`);
//         return true;
//     }
// }

// class Dog {
//     constructor(name) {
//         this.name = name;
//     }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// Function.prototype.myBind = function() {
//     let arr = Array.from(arguments);
//     let that = this

//     // function definition (...rest)
//     // function call (...spread)

//     return function (...input) {
//         let conc = (arr.slice(1, arr.length)).concat(input);
//         return that.call(arr[0], ...conc);
//     }

//     // if (arr.length === 1){
//         // return this.bind(arr[0]);
//     // } else if (arr.length === 2) {
//     //     return (input) => this.call(arr[0], arr[1], input);
//     // } else if (arr.length === 3) {
//     //     return () => this.call(arr[0], ...arr.slice(1, arr.length)); 
//     // }
// }

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

// CURRYING

function curriedSum(numArgs){
    let numbers = [];

    function _curriedSum(number){
        numbers.push(number);
        if (numbers.length === numArgs){
            return numbers.reduce(function(acc,val){
                return acc += val; //END
            }, 0);
        } else {
            return _curriedSum;  //MIDDLE
        }
    }
    
    return _curriedSum; //BEGIN
}

// const currieSum = curriedSum(1);
// console.log(currieSum(2)); // => 2

// const sumAgain = curriedSum(4);
// console.log(sumAgain(5)(30)(20)(1));


// Function.prototype.curry = function(numArgs) {
//     let that = this;
//     let args = [];

//     function subCurry(arg) {
//         args.push(arg);
//         if (args.length === numArgs) {
//             console.log(args);
//             return that.apply(that, args);
//         } else {
//             return subCurry;
//         }
//     }

//     return subCurry;
// }

Function.prototype.curry = function(numArgs) {
    let that = this;
    let args = [];

    function subCurry(arg) {
        args.push(arg);
        if (args.length === numArgs) {
            console.log(args);
            return that.call(that, ...args);
        } else {
            return subCurry;
        }
    }

    return subCurry;
}

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
  }
  
  sumThree(4, 20, 6); // == 30
  
  // you'll write `Function#curry`!
  let f1 = sumThree.curry(3);
  f1 = f1(4); // [Function]
  f1 = f1(20); // [Function]
  console.log(f1 = f1(6)); // = 30
