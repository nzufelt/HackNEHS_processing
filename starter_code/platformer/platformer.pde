final int displayWidth = 1200;
final int displayHeight = 1000;

float GRAVITY = 1;
float FRICTION = 0.25; // for x dampening
int GROUND = displayHeight - 150;

Character player;

void setup() {
  size(displayWidth, displayHeight);
  background(145, 187, 255);  // sky color
  
  fill(142, 103, 4); // ground color
  rect(0, GROUND, width, 150);
}

void draw() {
  background(145, 187, 255);  // sky color
  fill(142, 103, 4); // ground color
  rect(0, GROUND, width, 150);
}

void keyPressed() {
}