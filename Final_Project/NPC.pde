class NPC
{
  PVector pos;
  NPC(float a, float b)
  {
    pos = new PVector(a, b);
  }
  void display()
  {
    fill(50, 50, 250);
    stroke(0);
    ellipse(pos.x, pos.y, 40, 40);
  }
}