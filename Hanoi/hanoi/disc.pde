class Disc {
  float x,y;
  int height = 30;
  int width;
  int number;
  
  Disc(int number) {
    this.number = number;
    this.width = 10 * number + 30;
  }
  
  
  public void show() {
    fill((360/7)*number, 255, 255);
    //fill(255);
    rectMode(CENTER);
    rect(x,y,width,height);
  }
}
