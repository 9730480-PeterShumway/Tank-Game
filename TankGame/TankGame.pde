// 1 April 2026 | TankGame | Peter Shumway
Tank t1;
Obstacle o1, o2, o3;
PImage bg;

void setup () {
  size(500, 500);
  bg = loadImage("tg.png");
  t1 = new Tank();
  o1 = new Obstacle(400, 100, 100, 50, 1, 100);
  o2 = new Obstacle(400, 300, 100, 50, 1, 100);
  o3 = new Obstacle(400, 450, 100, 50, 1, 100);
}

void draw () {
  background(bg);
  t1.display();
  o1.display();
  o1.move();
  o2.display();
  o2.move();
  o3.display();
  o3.move();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}
