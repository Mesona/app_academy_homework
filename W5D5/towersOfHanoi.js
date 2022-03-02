const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

class Game {

    constructor(towers = [[3,2,1],[],[]]) {
        this.towers = towers;
    }

    // promptMove(callback) {
    //     reader.question("Take from which tower?", function (tower1) {
    //         let startTowerIdx = tower1;
    //         reader.question("Move to which tower?", function (tower2) {
    //             let endTowerIdx = tower2;
    //             // console.log(`taking from ${tower1} and moving to ${tower2}`)
    //             callback(startTowerIdx, endTowerIdx);
    //         });
    //     });
    // }

    move(startTowerIdx, endTowerIdx) {
        let start = this.towers[startTowerIdx];
        let end = this.towers[endTowerIdx];
        this.towers[endTowerIdx] = end.concat(start.pop());
    }

    isValidMove(startTowerIdx, endTowerIdx) {
        let start = this.towers[startTowerIdx];
        let end = this.towers[endTowerIdx];
        if (start === []) {
            console.log("Start tower is empty");
        } else if (start[start.length - 1] < end[end.length - 1] || (end.length === 0)) {
            this.move(startTowerIdx, endTowerIdx);
            // this.towers[endTowerIdx] = end.concat(start.pop());
            console.log(this.towers);
        } else {
            console.log("You did something very wrong");
        }
    }

    print() {

    }

    isWon() {
        console.log(this.towers[1] === [3, 2, 1]);
        if (this.towers[0].length === 0 && (this.towers[1] === [3, 2, 1] || this.towers[2] === [3, 2, 1])) {
            console.log("YOU WINNNNNNNNNNNNN!!!!!!!!");
        }
    }
    
}

const g = new Game([[], [3, 2, 1], []]);
g.isWon();
// g.promptMove(function(tower1, tower2){
//     console.log(`taking from ${tower1} and moving to ${tower2}`)
// });
// g.isValidMove(0, 2);
// g.isValidMove(0, 2);