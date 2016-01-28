class Charact {
  PVector loc;
  float diam;
  PImage cha = new PImage();

  Charact(float x, float y) {
    loc = new PVector (x, y);
    diam = 40;
    cha = loadImage("character down.png");
    cha.resize(60,50);
  }

  void display() {
    noFill();
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
    image(cha, loc.x, loc.y);
  }

  void move() {
    if (keyPressed)
    {
      switch(keyCode)
      {
        case UP:
          if (loc.y > diam/2)
          {
            loc.y -= 4;
            cha = loadImage("character up.png");
            cha.resize(60,50);
          }
          break;
        case DOWN:
          if (loc.y < height - diam/2)
          {
            loc.y += 4;
            cha = loadImage("character down.png");
            cha.resize(60,50);
          }
          break;
        case LEFT:
          if (loc.x > diam/2)
          {
            loc.x -= 4;
            cha = loadImage("character left.png");
            cha.resize(50,60);
          }
          break;
        case RIGHT:
          if (loc.x < 1050 - diam/2)
          {
            loc.x += 4;
            cha = loadImage("character right.png");
            cha.resize(50,60);
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