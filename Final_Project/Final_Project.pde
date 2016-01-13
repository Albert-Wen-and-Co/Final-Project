float playerX, playerY;//declare variables
NPC[] people = new NPC[2];

void setup()
{
  size(1200, 800);//set up canvas size
  playerX = width/2;//initialize variables
  playerY = height/2;
  people[0] = new NPC(100, 100);
  people[1] = new NPC(800, 100);
}

void draw()
{
  background(100, 200, 100);//draw the background
  
  fill(250, 50, 50);//draw the player
  stroke(0);
  ellipse(playerX, playerY, 40, 40);
  
  for(int i = 0; i < people.length; i++)//draw each NPC
  {
    people[i].display();
  }
  
  if(keyPressed)//move the player in 4 directions using the arrow keys
  {
    switch(keyCode)
    {
      case UP:
        playerY -= 4;
        break;
      case DOWN:
        playerY += 4;
        break;
      case LEFT:
        playerX -= 4;
        break;
      case RIGHT:
        playerX += 4;
    }
  }
  
  for(int i = 0; i < people.length; i++)//check if the player is in contact with an NPC
  {
    
  }
}