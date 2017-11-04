final int displayWidth = 1200;
final int displayHeight = 1000;

float GRAVITY = 1;
float FRICTION = 0.25; // for x dampening
int GROUND = displayHeight - 150;

ArrayList<Platform> level = new ArrayList<Platform>();

Character player;

void setup() {
  size(displayWidth, displayHeight);
  background(145, 187, 255);  // sky color
  noStroke();
  fill(142, 103, 4); // ground color
  rect(0, GROUND, width, 150);

  player = new Character(displayWidth / 2, GROUND);

  level.add(new Platform((int)random(100, width - 100), GROUND - 100, (int)random(100, 300), 40));
  level.add(new Platform((int)random(100, width - 100), GROUND - 100, (int)random(100, 300), 40));
}

void draw() {
  background(145, 187, 255);  // sky color
  fill(142, 103, 4); // ground color
  rect(0, GROUND, width, 150);
  player.show();
  for (Platform p : level) {
    if (player.standingOn(p)) {
      player.stopY();
    }
    p.show();
  }
}

void keyPressed() {
  //print(key);
  if (key == 'd') {
    player.move(10, 0);
  } else if (key == 'a') {
    player.move(-10, 0);
  } else if (key == 'w') {
    player.jump();
  }
}
