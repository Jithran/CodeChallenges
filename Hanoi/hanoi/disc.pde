class Disc {
  float x,y;
  int height = (rodheight-10) / n;
  int width;
  int number;
  
  Disc(int number) {
    this.number = number;
    this.width = 10 * number + 30;
    if(height > (rodheight-10) / 5) {
      height = (rodheight-10) / 5;
    }
  }
  
  
  public void show() {
    fill((360/n)*number, 255, 255);
    //fill(255);
    rect(x-(width/2),y,width,height);
  }
}
