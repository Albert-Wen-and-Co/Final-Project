class NPC
{
  PVector loc;
  float diam;
  PImage appearance;
  
  NPC(float a, float b, PImage im) //allow the location and the image assiociated with location to be chosen
  {
    loc = new PVector(a, b);
    diam = 40;
    appearance = im;
  }
  
  void display() //display locations as ellipses
  {
    image(appearance, loc.x, loc.y);
  }
}