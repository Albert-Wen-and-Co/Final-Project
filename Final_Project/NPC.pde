class NPC
{
  PVector loc;
  float diam;
  
  NPC(float a, float b) //the locations will be able to be specified
  {
    loc = new PVector(a, b);
    diam = 40;
  }
  
  void display() 
  //display locations as ellipses
  {
    noFill();
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
}