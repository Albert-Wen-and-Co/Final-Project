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
    //display the character at loc.x and loc.y
    noFill();
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
    image(cha, loc.x, loc.y);
  }

  void move() {
    //allow the character to be moved with the arrow keys
    if (keyPressed)
    {
      switch(keyCode)
      {
        case UP: //if the up arrow key is pressed, the character will move and be facing up
          if (loc.y > diam/2)
          {
            loc.y -= 6;
            cha = loadImage("character up.png");
            cha.resize(60,50);
          }
          break;
        case DOWN: //if the down arrow key is pressed, the character will move and be facing down
          if (loc.y < height - diam/2)
          {
            loc.y += 6;
            cha = loadImage("character down.png");
            cha.resize(60,50);
          }
          break;
        case LEFT: //if the left arrow key is pressed, the character will move and be facing left
          if (loc.x > diam/2)
          {
            loc.x -= 6;
            cha = loadImage("character left.png");
            cha.resize(50,60);
          }
          break;
        case RIGHT: //if the right arrow key is pressed, the character will move and be facing right
          if (loc.x < 1050 - diam/2)
          {
            loc.x += 6;
            cha = loadImage("character right.png");
            cha.resize(50,60);
          }
      }
    }
  }

  boolean contact(PVector loc2) { //check to see f the character is in contact with an NPC
    if (loc.dist(loc2) < diam) {
      return true;
    } 
    return false;
  }
}