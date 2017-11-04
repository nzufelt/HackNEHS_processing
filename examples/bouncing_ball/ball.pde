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