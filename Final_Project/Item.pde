class Item
{
  boolean have;
  PImage appearance;
  
  Item(PImage a)
  {
    appearance = a;
    have = false;
  }
  
  void display(float x, float y)
  {
    image(appearance, x, y, 50, 50);
    appearance.resize(100,100);
  }
}