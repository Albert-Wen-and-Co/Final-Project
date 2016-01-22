class NPC
{
  PVector loc;
  float diam;
  PImage appearance;
  
  NPC(float a, float b, PImage p)
  {
    loc = new PVector(a, b);
    diam = 40;
    appearance = p;
  }
  
  void display()
  {
    image(p, loc.x, loc.y);
  }
}