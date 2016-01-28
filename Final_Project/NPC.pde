class NPC
{
  PVector loc;
  float diam;
  PImage appearance;
  
  NPC(float a, float b, PImage im)
  {
    loc = new PVector(a, b);
    diam = 40;
    appearance = im;
  }
  
  void display()
  {
    image(appearance, loc.x, loc.y);
  }
}