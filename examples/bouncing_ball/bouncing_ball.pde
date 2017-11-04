final int displayWidth = 1200;
final int displayHeight = 1000;

ArrayList<Ball> ballList = new ArrayList<Ball>();

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  
  for (int i = 1; i < 10; i++) {
    ballList.add(new Ball(100 * i, 500, i - 5, 5 - i));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < ballList.size(); i++) {
    ballList.get(i).drawBall();
  }
}

void mousePressed() {
  for (int i = 0; i < ballList.size(); i++) {
    if (ballList.get(i).contains(mouseX, mouseY)) {
       ballList.remove(i);
       return;
    }
  }

  // No ball was removed, so add one!
  ballList.add(new Ball(mouseX, mouseY, (int)(random(10) - 5), (int)(random(10) - 5)));
}
