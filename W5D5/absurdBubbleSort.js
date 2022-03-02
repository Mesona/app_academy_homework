const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

// reader.question("What is your name?", function (answer) {
//     console.log(`Hello ${answer}!`);
//     reader.close(); 
// });

function askIfGreaterThan(el1, el2, callback) {
    reader.question(`Is ${el1} greater than ${el2}? `, function (answer) {
        let a = (answer === "yes") ? true : false;
        callback(a);
    })
}
function absurdBubbleSort(arr, sortCompletionCallback) {
    function outerBubbleSortLoop(madeAnySwaps) {
        if (madeAnySwaps === true) {
            innnerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
            reader.close();
        }
    }

    outerBubbleSortLoop(true);

}

function innnerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i === arr.length-1) {
        outerBubbleSortLoop(madeAnySwaps);
    } else {
        askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan){
            if (isGreaterThan === true) {
                [arr[i], arr[i+1]] = [arr[i + 1], arr[i]];
                madeAnySwaps = true;
            }
            i++;
            innnerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop)
        });
    }
}

absurdBubbleSort([2, 1, 3, 1, 5, 4], function (something) {
    console.log(something);
});

// innnerBubbleSortLoop([2,1,3], 0, false, function (something) {
//         console.log("answer " + something);
//     })

// askIfGreaterThan(5, 10, function (something) {
//     console.log(something);
// })