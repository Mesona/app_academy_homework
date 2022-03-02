
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

teaAndBiscuits = function() {
  reader.question("Would you like some tea? ", function (answer1) {
    console.log(`${answer1}`);
    reader.question("Would you like some biscuits? ", function(answer2) {
      console.log(`${answer2}`);

      let a1 = (answer1 === 'yes' ) ? 'do' : 'do not';
      let a2 = (answer2 === 'yes' ) ? 'do' : 'do not';

      console.log(`So you ${a1} want tea and you ${a2} want biscuits.`);
      reader.close();
    });
  });
};

teaAndBiscuits();