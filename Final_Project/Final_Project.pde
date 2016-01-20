Charact p;//declare variables
NPC[] people = new NPC[5];
Item[] possibleItems = new Item[5];
ArrayList<Item> inventory = new ArrayList<Item>();
PImage test;
boolean setupFlag;
void setup()
{
  size(1200, 800);//set up canvas size
  p = new Charact(width/2, height/2);//initialize variables
  people[0] = new NPC(100, 100);
  people[1] = new NPC(800, 100);
  people[2] = new NPC(200, 400);
  people[3] = new NPC(150, 300);
  people[4] = new NPC(900, 500);
  test = loadImage("new_item.png");
  for(int i = 0; i < possibleItems.length; i++)
  {
    possibleItems[i] = new Item(test);
  }
  setupFlag = false;
}

void draw()
{
  background(100, 200, 100);//draw the background and sidebar
  fill(150);
  rect(1050, 0, width, height);
  
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
      switch(i)
      {
        case 0:
          if(!setupFlag){
            cardsSetup();
            setupFlag = true;
          }
          cardsDraw();
      }
      fill(0);//replace this with something that starts a minigame
      rect(0, 0, width, 50);
      if(!hasItem(i))
      {
        inventory.add(possibleItems[i]);
      }
    }
  }
  
  for(int i = 0; i < inventory.size(); i++)
  {
    Item tempItem = inventory.get(i);
    tempItem.display(1100, 100 + 100 * i);
  }
}

boolean hasItem(int index)
{
  for(int i = 0; i < inventory.size(); i++)
  {
    Item tempItem = inventory.get(i);
    if(tempItem == possibleItems[index])
    {
      return true;
    }
  }
  return false;
}