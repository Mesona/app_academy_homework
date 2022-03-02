
function MovingObject (name) {
    this.name = name

}

MovingObject.prototype.move = function() {
    console.log(`${this.name} moves`);
}

function Ship (name) {
    MovingObject.call(this, name);

}

function Asteroid (name) {
    MovingObject.call(this, name);
};




Function.prototype.inherits = function(parent) {
    let child = this;
    
    function Surrogate() {};
    
    Surrogate.prototype = parent.prototype;
    child.prototype = new Surrogate();
    child.prototype.constructor = child;
}


Asteroid.inherits(MovingObject);
Ship.inherits(MovingObject);

Asteroid.prototype.crash = function(ship) {
    console.log(`${this.name} crashes into ${ship.name}`);
}

let ship1 = new Ship('John');
ship1.move();
let asteroid1 = new Asteroid('Steven');
asteroid1.crash(ship1);
// ship1.crash(asteroid1);
let movingThing = new MovingObject('Bob');
// movingThing.crash(movingThing);
