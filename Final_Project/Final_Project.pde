float playerX, playerY;
void setup()
{
  size(1200, 800);
  playerX = width/2;
  playerY = height/2;
}

void draw()
{
  background(100, 200, 100);
  
  fill(250, 50, 50);
  stroke(0);
  ellipse(playerX, playerY, 40, 40);
  
  if(keyPressed)
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
  
  
  }