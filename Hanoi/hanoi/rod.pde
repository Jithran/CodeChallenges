class Rod {
  ArrayList<Disc> disc = new ArrayList<Disc>();

  float x;
  float y = 50;
  char selector;

  int height= rodheight;
  int width = 10;
  int basewidth = 10 * n + 40;

  Rod(char selector_, float x_) {
    this.x = x_;
    this.selector = selector_;
  }

  void show() {
    fill(200, 100, 255);
    rect(x-(width/2), y, width, height);
    rect(x-((basewidth)/2), y+height, basewidth, 20);

    for (int i=0; i<disc.size(); i++) {
      disc.get(i).show();
    }
  }

  void addDisc(Disc disc) {
    if (disc != null) {
      disc.x = this.x;
      disc.y = (y+height)-(disc.height * (this.disc.size()+1));
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
