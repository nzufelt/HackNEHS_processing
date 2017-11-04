class Character {
  int x;
  int y;
  PImage img; 
  
  float vx;
  float vy;

  Character(int x, int y) {
    this.x = x;
    this.y = y;
    img = loadImage("asset.png");
  }
  
  void drawMe() {
    image(img, x, y - 200, 150, 200);
    
    // if I'm jumping
    if (y < GROUND) {
      y += vy;      
      vy += GRAVITY;
    } else {
      // we just finished a jump;
      vy = 0; 
    }
    
    if (abs(vx) > 1) {
      x += vx;
      if (frameCount % 10 == 0) {
        // slow down the x-speed  
        vx *= FRICTION;
      }
    } else {
      vx = 0; 
    }
     
    
  }
  
  
  void move(int dx, int dy) {
    vx += dx;
    vy += dy;
  }
  
  // begin a jump
  void jump() {
    vy = -16;
    y += vy;      
  }
  
  boolean standingOn(Platform p) {
    return false;
  }
  
  void stopY() {
    vy = 0;  
  }
}