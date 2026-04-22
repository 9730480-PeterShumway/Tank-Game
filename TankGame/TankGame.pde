// 1 April 2026 | TankGame | Peter Shumway
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
//Obstacle o1, o2, o3;
PImage bg;
int score;
Timer objTimer;

void setup () {
  size(500, 500);
  score = 0;
  bg = loadImage("tg.png");
  t1 = new Tank();
  //o1 = new Obstacle(400, 100, 100, 50, 1, 100);
  //o2 = new Obstacle(400, 300, 100, 50, 1, 100);
  //o3 = new Obstacle(400, 450, 100, 50, 1, 100);
  objTimer = new Timer(1000);
  objTimer.start();
}

void draw () {
  background(bg);

  // Distrubute object on timer
  if (objTimer.isFinished()) {
    // add object
    obstacles.add(new Obstacle(0, random(height), 100, 100, random(2, 5), 10));
    //restart timer
    objTimer.start();
  }
  //gets rid of bullets i think
  for (int i = 0; i <obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.offScreen()) {
      obstacles.remove(i);
    }
  }
  //  Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j <obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score += 100;
        projectiles.remove(i);
        obstacles.remove(j);
      }
    }
    p.display();
    p.move();
    if(p.offScreen()) {
      projectiles.remove(i);
    }
  }
  t1.display();
  //o1.display();
 //o1.move();
  //o2.display();
  //o2.move();
 //o3.display();
  //o3.move();
  scorePanel();
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

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    float speed = 5;


    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}


void scorePanel() {
  fill(127, 50);
  rectMode(CENTER);
  rect(width/2, 15, width, 30);
  fill(1);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
}
