// reference: https://en.wikipedia.org/wiki/Maurer_rose

/*let n = 6;
let d = 71;*/

let n = 0;
let d = 0;

function setup() {
  createCanvas(displayWidth, displayHeight);
  angleMode(DEGREES);
}

function mousePressed() {
  if (mouseX > 0 && mouseX < displayWidth && mouseY > 0 && mouseY < displayHeight) {
    let fs = fullscreen();
    fullscreen(!fs);
  }
}

function draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);
  
  noFill();
  beginShape();
  stroke(0,0,255,200);
  strokeWeight(1);
  for (let i = 0; i < 360; i++) {
    let k = i * d;
    let r = displayHeight / 2.5 * sin(n*k);
    let x = r * cos(k);
    let y = r * sin(k);
    vertex(x,y);
  }
  endShape();
  
  beginShape();
  stroke(255,0,255,200);
  strokeWeight(3);
  for (let i = 0; i < 360; i++) {
    let k = i;
    let r = displayHeight / 2.5 * sin(n*k);
    let x = r * cos(k);
    let y = r * sin(k);
    vertex(x,y);
  }
  endShape();
  n = n+=0.002;
  d = d+=0.006;
}