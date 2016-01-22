class NPC
{
  PVector loc;
  float diam;
  
  NPC(float a, float b)
  {
    loc = new PVector(a, b);
    diam = 40;
  }
  
  void display()
  {
    noFill();
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
}