class PowerUp {
  float x, y, w, h, speed;
  char type; 

  PowerUp(float w, float h) {
    this.w = w;
    this.h = h;
    speed = 2;

    x = random(width);
    y = random(height);

   
    if (random(1) < 0.5) {
      type = 'h';
    } else {
      type = 's';
    }
  }

  void display() {
    if (type == 'h') {
      fill(0, 255, 0);
    } else {
      fill(0, 0, 255);
    }
    ellipse(x, y, w, h);
  }

  void move() { }
  boolean intersects(Tank t) {
    float d = dist(x, y, t.x, t.y);
    return d < (w/2 + t.w/2);
  }

  void applyEffect(Tank t) {
    if (type == 'h') {
      t.health += 20;
    } 
  }

  boolean offScreen() {
    return y > height + h;
  }
}
