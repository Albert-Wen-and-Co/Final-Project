Charact p;
void setup()
{
  size(1200, 800);
  p = new Charact(width/2, height/2);
}

void draw()
{
  background(100, 200, 100);
  
  p.display();
  
  p.move();
}