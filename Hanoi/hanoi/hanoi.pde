int n = 7; // Number of disks 
Rod rod[] = new Rod[3];
int ither = 0;
int loop = 0;
double max = pow(2, n)+1;

void setup() {
  size(600, 300);
  colorMode(HSB, 360, 255, 255);
  resetTowers();
}

void draw() {
  loop++;
  ither = 0;
  delay(300);

  background(0);
  for (int i = 0; i < rod.length; i++) {
    rod[i].show();
  }

  resetTowers();
  towerOfHanoi(n, 0, 2, 1);
}

void resetTowers() {
  rod = new Rod[3];
  rod[0] = new Rod('A', 100);
  rod[1] = new Rod('B', 300);
  rod[2] = new Rod('C', 500);

  for (int i=n; i>0; i--) {
    rod[0].addDisc(new Disc(i));
  }
}

void towerOfHanoi(int n, int from_rod, int to_rod, int aux_rod) 
{ 
  if (n == 1) 
  { 
    moveDisc(from_rod, to_rod);
    return;
  } 
  towerOfHanoi(n-1, from_rod, aux_rod, to_rod); 
  moveDisc(from_rod, to_rod);
  towerOfHanoi(n-1, aux_rod, to_rod, from_rod);

  if (loop >= max) {
    System.out.println("Stopped"); 
    noLoop();
  }
} 

void moveDisc (int from_rod, int to_rod) {
  ither++;

  if (loop > ither) {
    System.out.println("Move one disk from rod " +  from_rod + " to rod " + to_rod); 
    rod[to_rod].addDisc(rod[from_rod].getTopDisc());
  }
}
