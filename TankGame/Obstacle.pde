class Obstacle {
  // Member Variable
  float x, y, w, h, speed, health;
  //PImage tankD,
  char idir;

  // Constructor
  Obstacle(float x, float y, float h, float w, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    idir = 'w';
  }

  void display() {
    fill(127);
    rectMode(CENTER);
    rect(x, y, h, w);
  }

  void move() {
    x=x+speed;
  }

  void fire() {
  }
}
