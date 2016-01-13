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
    fill(50, 50, 250);
    stroke(0);
    ellipse(loc.x, loc.y, diam, diam);
  }
}