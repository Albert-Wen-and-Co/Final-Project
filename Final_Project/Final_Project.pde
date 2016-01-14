Charact p;//declare variables
NPC[] people = new NPC[5];
Item[] inventory = new Item[5];
void setup()
{
  size(1200, 800);//set up canvas size
  p = new Charact(width/2, height/2);//initialize variables
  people[0] = new NPC(100, 100);
  people[1] = new NPC(800, 100);
  people[2] = new NPC(200, 400);
  people[3] = new NPC(150, 300);
  people[4] = new NPC(900, 500);
  for(int i = 0; i < inventory.length; i++)
  {
    inventory[i] = new Item(null);
  }
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
    if(p.contact(people[i].loc))
    {
      fill(0);//replace this with something that starts a minigame
      rect(0, 0, width, 50);
    }
  }
  
  for(int i = 0; i < inventory.length; i++)
  {
    if(inventory[i].have)
    {
      inventory[i].display(1100, 100 + 100 * i);
    }
  }
}