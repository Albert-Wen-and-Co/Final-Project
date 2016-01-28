class Answer
{
  PVector loc; //initialize variables
  float wid;
  
  Answer(float x, float y) //allow the location of the answer to be chosen
  {
    loc = new PVector(x,y);
    wid = 200;
  }
  
  void display() //display the answers in rectangles
  {
    fill(255);
    rect(loc.x,loc.y,wid,wid);
  }
  
  boolean touch(PVector mouse) //check if the mouse is touching the answer
  {
    if(loc.dist(mouse) <= wid/2)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}