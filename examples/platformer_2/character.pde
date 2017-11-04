class Character {
  int x, y, w, h;
  float xSpeed, ySpeed;
  float accel, deccel;
  float maxXspd, maxYspd;
  float xSave, ySave;
  int xRep, yRep;
  float gravity;
  PImage img;
  boolean reversed;
  
  Character(int xp, int yp ) {
    x = xp;
    y = yp;
    xSpeed = 0;
    ySpeed = 0;
    accel = 0.5;
    deccel = 0.5;
    maxXspd = 6;
    maxYspd = 12;
    xSave = 0;
    ySave = 0;
    xRep = 0;
    yRep = 0;
    gravity = 0.33;
    img = loadImage("asset.png");
    w = 150;
    h = 200;
  }
  void update() {
    if ( right ) {
      reversed = false;
      xSpeed += accel;
      if ( xSpeed > maxXspd ) {
        xSpeed = maxXspd;
      }
    }
    else if ( left ) {
      reversed = true;
      xSpeed -= accel;
      if ( xSpeed < -maxXspd ) {
        xSpeed = -maxXspd;
      }
    }
    else { //neither right or left pressed, decelerate
      if ( xSpeed > 0 ) {
        xSpeed -= deccel;
        if ( xSpeed < 0 ) {
          xSpeed = 0;
        }
      }
      else if ( xSpeed < 0 ) {
        xSpeed += deccel;
        if ( xSpeed > 0 ) {
          xSpeed = 0;
        }
      }
    }
    
    // can I jump?
    if ( up ) {
      if ( !placeFree(x, y+10) || !placeFree(x+15,y+10) ) {
        ySpeed = -10;
      }
    }
    
    ySpeed += gravity;
    
    /*
    // The technique used for movement involves taking the integer (without the decimal)
    // part of the player's xSpeed and ySpeed for the number of pixels to try to move,
    // respectively.  The decimal part is accumulated in xSave and ySave so that once
    // they reach a value of 1, the player should try to move 1 more pixel.  This jump
    // is not normally visible if it is moving fast enough.  This method is used because
    // is guarantees that movement is pixel perfect because the player's position will
    // always be at a whole number.  Whole number positions prevents problems when adding
    // new elements like jump through blocks or slopes.
    */
    xRep = 0; //should be zero because the for loops count it down but just as a safety
    yRep = 0;
    xRep += floor(abs(xSpeed));
    yRep += floor(abs(ySpeed));
    xSave += abs(xSpeed)-floor(abs(xSpeed));
    ySave += abs(ySpeed)-floor(abs(ySpeed));
    int signX = (xSpeed<0) ? -1 : 1;
    int signY = (ySpeed<0) ? -1 : 1;
    //when the player is moving a direction collision is tested for only in that direction
    //the offset variables are used for this in the for loops below
    int offsetX = (xSpeed<0) ? 0 : 2;
    int offsetY = (ySpeed<0) ? 0 : 2;
    
    if ( xSave >= 1 ) {
      xSave -= 1;
      xRep++;
    }
    if ( ySave >= 1 ) {
      ySave -= 1;
      yRep++;
    }
    
    // can I move in the y-direction?
    for ( ; yRep > 0; yRep-- ) {
      if ( (signY < 0) || (placeFree(x + w/4,y+offsetY+signY) && placeFree(x + 3*w/4,y+offsetY+signY)) ) {
        y += signY;
      }
      else {
        ySpeed = 0;
      }
    }
    
    // can I move in the x-direction?
    for ( ; xRep > 0; xRep-- ) {
      //if ( x+offsetX+signX > 0 && x + w +offsetX+signX < width ) {
        x += signX;
      //}
      //else {
      //  xSpeed = 0;
      //}
    }
      
      
    //if (player.standingOn(p)) {
    //  player.stopY(); 
    //}
      
      
  }
  
  
  void show() {
    // pushMatrix and popMatrix are used to keep all the coordinate transformations lined up 

    if (reversed) {
      pushMatrix();
      scale(-1.0, 1.0);
      translate(-x + 3 * w,y-h);
      image(img, -img.width, 0, w, h);
      //image(img,-img.width,0);
      popMatrix();
    } else {
      image(img, x, y - h, w, h);      
    } 
  }
}