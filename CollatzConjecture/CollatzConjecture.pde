import processing.pdf.*;

void setup() {
  //size(1200, 600);
  fullScreen();
  beginRecord(PDF, "collatz.pdf");
  background(0);
  colorMode(HSB,360,255,255);
  for (int i = 1; i < 10000; i++) {
    IntList sequence = new IntList();
    int n = i;
    do {
      sequence.append(n);
      n = collatz(n);
    } while (n != 1);
    sequence.append(1);
    sequence.reverse();
    float len = height/100.0;
    float angle = 0.15;
    resetMatrix();
    translate(width/2, height);

    if (n % 2 == 0) {
      rotate(angle/2);
    } else {
      rotate(-angle/2);
    }

    for (int j = 0; j < sequence.size(); j++) {
      int value = sequence.get(j);
      if (value % 2 == 0) {
        rotate(angle*1.1);
      } else {
        rotate(-angle);
      }
      strokeWeight(2);
      float h = map(i, 0, 10000, 0, 360);
      stroke(h, 255, 255,40);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
  }
  endRecord();
}
int collatz(int n) {
  // even
  if (n % 2 == 0) {
    return n / 2;
    // odd
  } else {
    return (n * 3 + 1)/2;
  }
}
