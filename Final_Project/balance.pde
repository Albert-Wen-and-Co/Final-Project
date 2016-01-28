float balanceX;//goes from -400 to 400, distance from middle of screen
float balanceAngle;//goes from -1 to 1, angle of the beam where 1 unit = 45 degrees
int balanceEnd;
int balanceTime;

void balanceSetup()
{
  balanceX = random(-50, 50);//start the player at a random position
  balanceAngle = 0;//start the beam as balanced
  balanceEnd = millis() + 15000;//set the time that the game will end
}

void balanceDraw()
{
  balanceTime = balanceEnd - millis();//update the game time
  
  if(balanceTime > 0 && balanceX >= -400 && balanceX <= 400)//if the game has not ended yet
  {
    balanceAngle -= balanceX / 2400;//tilt the beam proportional to how far from the center you are
    
    balanceX -= balanceAngle;//slide the player proportional to how tilted the beam is
    
    background(255);
    
    stroke(0);
    strokeWeight(10);
    line(200, 400 + balanceAngle * 400, 1000, 400 - balanceAngle * 400);//draw the beam
    
    fill(255, 0, 0);
    noStroke();
    ellipse(600 + balanceX, 400 - balanceX * balanceAngle, 80, 80);//draw the player on the beam
    
    if (keyPressed)//make the player move if the arrow keys are pressed
    {
      switch(keyCode)
      {
      case LEFT:
        balanceX -= 2;
        break;
      case RIGHT:
        balanceX += 2;
      }
    }
  }
  else//if the game has ended
  {
  }
}