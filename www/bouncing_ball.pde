final int displayWidth = 600;
final int displayHeight = 300;

ArrayList<Ball> ballList = new ArrayList<Ball>();

void setup() {
  size(displayWidth, displayHeight);
  background(255,255,255);

  for (int i = 1; i < 10; i++) {
    if (i != 5)
        ballList.add(new Ball((displayWidth/10) * i,(displayHeight/2) , i - 5, 5 - i));
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
  ballList.add(new Ball(mouseX, mouseY, (int)(Math.random()*10 - 5), (int)(Math.random()*10 - 5)));
}

class Ball {
  int r = 40;
  int x, y, vx, vy;
  color c;

  Ball(int x, int y, int vx, int vy) {
    this.x = x;
    this.y = y;

    this.vx = vx;
    this.vy = vy;
    this.c = randomColor();
  }

  void drawBall() {
    fill(c);
    ellipse(x, y, r, r);

    // Deal with hitting edges
    if (x <= r || x >= width - r) {
      vx *= -1;

    }
    if (y <= r || y >= height - r) {
      vy *= -1;

    }

    x += vx;
    y += vy;
  }

  boolean contains(int mx, int my) {
    return Math.abs(mx - x) < r && Math.abs(my - y) < r;
  }

  color randomColor() {
    return color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
}
