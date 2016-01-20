class Charact {
  PVector loc;
  float diam;

  Charact(float x, float y) {
    loc = new PVector (x, y);
    diam = 40;
  }

  void display() {
    noFill();
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
    image(character, loc.x, loc.y);
  }

  void move() {
    if (keyPressed)
    {
      switch(keyCode)
      {
      case UP:
        if (loc.y > diam/2)
        {
          loc.y -= 3;
        }
        break;
      case DOWN:
        if (loc.y < height - diam/2)
        {
          loc.y += 3;
        }
        break;
      case LEFT:
        if (loc.x > diam/2)
        {
          loc.x -= 3;
          rotate(PI);
          image(character, loc.x, loc.y);
        }
        break;
      case RIGHT:
        if (loc.x < 1050 - diam/2)
        {
          loc.x += 3;
        }
      }
    }
  }

  boolean contact(PVector loc2) {
    if (loc.dist(loc2) < diam) {
      return true;
    } 
    return false;
  }
}