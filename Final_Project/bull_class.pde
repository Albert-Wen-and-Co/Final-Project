class Bulls {
  PVector loc; //create a PVector for location of velocity
  PVector vel;
  float acc=.08; //initalize and define variables
  float diam=60;
  
  PImage lantern;
  
  Bulls(float x, float y) {
    //initialize all starting values
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
    lantern=loadImage("lantern.png"); //display the lanterns on the ellipses
  }

  void display() {
    //display lanterns
    noFill();
    ellipse(loc.x, loc.y, diam, diam);
    image(lantern,loc.x,loc.y);
    lantern.resize(80,95);
 
  }

  void fall() { 
    //make the lantern fall to the bottom of the screen by adding acceleraltion to the velocity
    vel.y += acc;
    loc.add(vel);
  }

  void reset() {
    //return the lantern back to the top portion of the screen at a random location.
    loc.set(random(width), random(height/3));
    vel.set(0, .5);
    acc=.1;
  }

  boolean isInContactWith(PVector other) {
    //if the lantern touches the character,it will return to the top
    if (loc.dist(other) <= diam/2+diam/2) {
      return true;
    } else {
      return false;
    }
  }

}