class Rod {
  ArrayList<Disc> disc = new ArrayList<Disc>();

  float x;
  float y = 155.0;
  char selector;

  int height= 230;
  int width = 10;

  Rod(char selector_, float x_) {
    this.x = x_;
    this.selector = selector_;
  }

  void show() {
    fill(200, 100, 255);
    rectMode(CENTER);
    rect(x, y, width, height);
    rect(x, y+(height/2), width+100, 20);

    for (int i=0; i<disc.size(); i++) {
      disc.get(i).show();
    }
  }

  void addDisc(Disc disc) {
    if (disc != null) {
      disc.x = this.x;
      disc.y = 245-(disc.height * this.disc.size());
      this.disc.add(disc);
    }
  }

  Disc getTopDisc() {
    if (this.disc.size() == 0) {
      return null;
    }
    Disc disc = this.disc.get(this.disc.size()-1);
    removeTopDisc();
    return disc;
  }

  void removeTopDisc() {
    this.disc.remove(this.disc.size()-1);
  }
}
