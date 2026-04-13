class Tank {
  // Member Variable
  float x, y, w, h, speed, health;
  PImage tankD, tankS, tankA, tankW;
  char idir;
  // Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 10.0;
    health = 75.0;
    tankD = loadImage("tankD.png");
    tankS = loadImage("tankS.png");
    tankA = loadImage("tankA.png");
    tankW = loadImage("tankW.png");
    idir = 'w';
  }
  
  void display() {
    imageMode(CENTER);
    //image(iTank,x,y);
    if(idir=='d') {
    image(tankD,x,y);
    } else if (idir=='s') {
    image(tankS,x,y);
    } else if (idir=='a') {
    image(tankA,x,y);
    } else if (idir=='w') {
    image(tankW,x,y);
    }
    
    
  }

  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 's') {
      idir = 's';
      y = y + speed;
    } else if (dir == 'a') {
      idir = 'a';
      x = x - speed;
    } else if (dir == 'd') {
      idir = 'd';
      x = x + speed;
    }
  }

  void fire() {
  }
}
