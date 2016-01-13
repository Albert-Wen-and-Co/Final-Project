Charact p;//declare variables
NPC[] people = new NPC[2];
void setup()
{
  size(1200, 800);//set up canvas size
  p = new Charact(width/2, height/2);//initialize variables
  people[0] = new NPC(100, 100);
  people[1] = new NPC(800, 100);
}

void draw()
{
  background(100, 200, 100);//draw the background
  
  p.display();
  
  p.move();
  
  for(int i = 0; i < people.length; i++)//draw each NPC
  {
    people[i].display();
  }
  
  for(int i = 0; i < people.length; i++)//check if the player is in contact with an NPC
  {
    
  }
}