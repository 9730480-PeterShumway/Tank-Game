// 1 April 2026 | TankGame | Peter Shumway
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
//Obstacle o1, o2, o3;
PImage bg;
int score;
Timer objTimer, puTimer;
ArrayList<PowerUp> powerUps;
Timer powerTimer;

void setup () {
  powerUps = new ArrayList<PowerUp>();
  powerTimer = new Timer(5000); // spawn every 5 seconds
  powerTimer.start();
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
  if (powerTimer.isFinished()) {
    powerUps.add(new PowerUp(30, 30));
    powerTimer.start();
  }

  for (int i = powerUps.size() - 1; i >= 0; i--) {
    PowerUp p = powerUps.get(i);

    p.move();
    p.display();

    if (p.intersects(t1)) {
      p.applyEffect(t1);
      powerUps.remove(i);
    } else if (p.offScreen()) {
      powerUps.remove(i);
    }
  }
  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(0, random(height), 100, 100, random(2, 5), 5));
    objTimer.start();
  }

  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
     if (t1.intersect(o)) {
  t1.takeDamage(10);
}
    if (o.offScreen()) {
      obstacles.remove(i);
    }
  }
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);

    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score += 100;
        projectiles.remove(i);
        obstacles.remove(j);
        break; 
      }
    }

    p.display();
    p.move();
   

    if (p.offScreen()) {
      projectiles.remove(i);
    }
  }
  t1.display();
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
    float speed = 10;


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
  text("Health: " + t1.health, width/2, 55);
}
