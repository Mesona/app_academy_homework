
function MovingObject(object) {
    this.pos = object.pos;
    this.vel = object.vel;
    this.radius = object.radius;
    this.color = object.color;
}

MovingObject.prototype.draw = function (ctx){
    ctx.beginPath();
    ctx.arc(100, 75, 50, 0, 2 * Math.PI);
    ctx.fillStyle = "#FF0000";
    ctx.stroke();
}

module.exports = MovingObject;