class Item//class for items which you collect from NPCs
{
  PImage appearance;//declare image variable
  
  Item(PImage a)//construct with the image
  {
    appearance = a;
  }
  
  void display(float x, float y) //display the key image
  {
    image(appearance, x, y, 50, 50);
  }
}