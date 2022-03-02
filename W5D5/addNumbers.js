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

const addNumbers = function(sum, numsLeft, completionCallback) {
    if (numsLeft === 1) {
        reader.question("Please enter a number", function (answer) {
            // sum += answer + addNumbers(sum, numsLeft-1, completionCallback);
            sum += parseInt(answer, 10);
            console.log(sum);
            completionCallback(sum);
            reader.close();
        });
    }
    reader.question("Please enter a number", function (answer) {
        // sum += answer + addNumbers(sum, numsLeft-1, completionCallback);
        sum += parseInt(answer, 10);
        console.log(sum);
        addNumbers(sum, numsLeft-1, completionCallback);
    });
}

// addNumbers(0, 2, function (num) {
//     console.log(num);
// });

addNumbers(0, 2, function(num) {
    console.log(25 + num);
})