class Bulls {
  PVector loc; //create a PVector for location of velocity
  PVector vel;
  float acc=.08; //initalize and define variables
  float diam=25;
  

  Bulls(float x, float y) {
    //initialize all starting values
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
  }

  void display() {
    //display bulls
    fill(225,0,0);
    ellipse(loc.x, loc.y, diam, diam);
 
  }

  void fall() { 
    //make the bull "run" to the bottom of the screen (fall) by adding acceleraltion to the velocity
    vel.y += acc;
    loc.add(vel);
  }

  void reset() {
    //return the bull back to the top of the screen at a random location.
    loc.set(random(width), 0);
    vel.set(0, .5);
    acc=.1;
  }

  boolean isInContactWith(Charact ch) {
    //if the bull touches the character,it will return to the top
    if (loc.dist(ch.loc) <= diam/2+ch.diam/2) {
      return true;
    } else {
      return false;
    }
  }

}