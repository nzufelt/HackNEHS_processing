class Platform {
  int x, y, w, h;
  color c;
  
  // using `p` here to avoid writing `this.` 
  Platform(int xp, int yp, int wp, int hp) {
    x = xp;
    y = yp;
    w = wp;
    h = hp;
    c = color(random(255), random(255), random(255));
  }
  
  void show() {
    fill(c);
    rect(x, y, w, h, 10);
  }
 
  void setColor(color cp) {
    c = cp; 
  }
  
  boolean contains(int xp, int yp) {
    return (x < xp) && (y < yp) && (xp - x < w) && (yp - y < h);
  }
}