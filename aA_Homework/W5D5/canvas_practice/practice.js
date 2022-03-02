document.addEventListener("DOMContentLoaded", function(){

});

// const canvas = document.getElementById('mycanvas');
// const ctx = canvas.getContext('2d');

// ctx.fillStyle = 'green';
// ctx.fillRect(250, 250, 50, 50);

// ctx.beginPath();
// ctx.fillStyle = 'blue';
// ctx.lineWidth = 5;
// ctx.arc(100, 75, 50, 0, 2 * Math.PI);
// ctx.stroke();
// ctx.fillStyle = 'orange';
// ctx.fill();
// ctx.clearRect(0, 0, canvas.width, canvas.height);

// ctx.beginPath();
// ctx.arc(100, 100, 50, 2 * Math.PI);
// ctx.strokeStyle = 'blue';


const sun = new Image();
const moon = new Image();
const earth = new Image();
init = function() {
  sun.src = 'https://mdn.mozillademos.org/files/1456/Canvas_sun.png';
  moon.src = 'https://mdn.mozillademos.org/files/1443/Canvas_moon.png';
  earth.src = earth.src = 'https://mdn.mozillademos.org/files/1429/Canvas_earth.png';
  window.requestAnimationFrame(draw);
};

draw = function() {
  const ctx = document.getElementById('canvas').getContext('2d');

  ctx.globalCompositionOperation = 'destination-over';
  ctx.clearRect(0,0,300,300);

  ctx.fillStyle = 'rgba(0,0,0,0.4)';
  ctx.strokeStyle = 'rgba(0,153,255,0.4)';
  ctx.save();
  ctx.translate(150,150);

  // Earth
  const time = new Date();
  ctx.rotate(((2 * Math.PI) / 60) * time.getSeconds() + ((2 * Math.PI) / 60000) * time.getMilliseconds());
  ctx.translate(105, 0);
  ctx.fillRect(0, -12, 40, 24); // shadow
  ctx.drawImage(earth, -12, -12);

  // Moon
  ctx.save();
  ctx.rotate(((2 * Math.PI) / 6) * time.getSeconds() + ((2 * Math.PI) / 6000) * time.getMilliseconds());
  ctx.translate(0, 28.5);
  ctx.drawImage(moon, -3.5, -3.5);
  ctx.restore();

  ctx.restore();

  ctx.beginPath();
  ctx.arc(150, 150, 105, 0, Math.PI * 2, false); // Earth orbit
  ctx.stroke();

  ctx.drawImage(sun, 0, 0, 300, 300);

  window.requestAnimationFrame(draw);
};

init();
