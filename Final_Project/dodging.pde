class Dodge {
  PVector loc;
  PVector vel;
  float diam=20;
  float acc=.08;
  float sc=0;

  Dodge(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0, .5);
  }

  void display() {
    fill(255, 0, 0); 
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    vel.y += acc;
    loc.add(vel);
  }

  void reset() {
    loc.set(random(width), 0);
    vel.set(0, .5);
    acc=.1;
  }

  boolean isInContactWith(PVector other) {
    //if a falling object hits the person, it returns to the top
    if (loc.dist(other) <= diam/2) {
      return true;
    } else {
      return false;
    }
  }

  void score() {
    if (loc.dist(other) <= diam/2)
    {
      sc=sc-1;
    }
}