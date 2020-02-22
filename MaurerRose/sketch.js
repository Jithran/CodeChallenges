// reference: https://en.wikipedia.org/wiki/Maurer_rose

/*let n = 6;
let d = 71;*/

let n = 3;
let d = 47;

function setup() {
  createCanvas(400, 400);
  angleMode(DEGREES);
}

function draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255);
  
  noFill();
  beginShape();
  stroke(200,200,255,100);
  strokeWeight(1);
  for (let i = 0; i < 360; i++) {
    let k = i * d;
    let r = 150 * sin(n*k);
    let x = r * cos(k);
    let y = r * sin(k);
    vertex(x,y);
  }
  endShape();
  
  beginShape();
  stroke(0,0,255,200);
  strokeWeight(3);
  for (let i = 0; i < 360; i++) {
    let k = i;
    let r = 150 * sin(n*k);
    let x = r * cos(k);
    let y = r * sin(k);
    vertex(x,y);
  }
  endShape();
}