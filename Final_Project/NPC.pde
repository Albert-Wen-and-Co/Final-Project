class NPC//class for NPCs which host minigames and give items
{
  PVector loc;//declare variables
  float diam;
  PImage appearance;
  
  NPC(float a, float b, PImage im)//construct with location, diameter, and image
  {
    loc = new PVector(a, b);
    diam = 40;
    appearance = im;
  }
  
  void display() 
  //display image at the location
  {
    image(appearance, loc.x, loc.y);
  }
}