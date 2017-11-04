// adapted from: 
// https://www.openprocessing.org/sketch/17115#

final int displayWidth = 1200;
final int displayHeight = 1000;
int GROUND = displayHeight - 150;

Character player;

//booleans for key presses to get a simple yes or no press and 
//to not have to worry about the a,aaaaaaaaaaaaa thing
boolean right = false, left = false, up = false;

// The platforms
ArrayList<Platform> level = new ArrayList<Platform>(); 

void setup() {
  size(displayWidth, displayHeight);
  drawLevel();
  
  player = new Character(displayWidth / 2, displayHeight / 2);
  
  // add ground
  level.add(new Platform(0, GROUND, width, 150));
  level.get(0).setColor(color(142, 103, 4));
  
  for (int i = 1; i < 8; i++) {
    level.add(new Platform((int)random(300, width - 300), GROUND - 100* i, (int)random(100, 300), 40));
  }
}

void draw() {
  drawLevel();
  player.update();
  player.show();
}

void drawLevel() {
  background(145, 187, 255);  // sky color
  noStroke();
  fill(142, 103, 4); // ground color
  rect(0, GROUND, width, 150);
  for (Platform p : level) {
    p.show(); 
  }
}

boolean placeFree(int xx,int yy) {
  //checks if a given point (xx,yy) is free (no obstacle at that point)
  
  for (Platform p : level) {
    if(p.contains(xx, yy))
      return false;
  }
  return true;
}

void keyPressed() {
  switch(keyCode) {
    case RIGHT: right = true; break;
    case LEFT: left = true; break;
    case UP: up = true; break;
  }
}

void keyReleased() {
  switch(keyCode) {
    case RIGHT: right = false; break;
    case LEFT: left = false; break;
    case UP: up = false; break;
  }
}