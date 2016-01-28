class Item
{
  boolean have; //boolean to see if the player obtained the item
  PImage appearance;
  
  Item(PImage a)
  {
    appearance = a;
    have = false;
  }
  
  void display(float x, float y) //display the key image
  {
    image(appearance, x, y, 50, 50);
  }
}