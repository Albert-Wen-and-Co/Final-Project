float balanceX;//goes from -400 to 400, distance from middle of screen
float balanceAngle;//goes from -1 to 1, angle of the beam where 1 unit = 45 degrees
int balanceEnd;
int balanceTime;

void balanceSetup()
{
  balanceX = random(-75, 75);//start the player at a random position
  balanceAngle = 0;//start the beam as balanced
  balanceEnd = millis() + 20000;//set the time that the game will end
  balanceTime = 20000;
  textAlign(CENTER);
  textSize(32);
}

void balanceDraw()
{
  if(balanceTime > 0 && balanceX >= -400 && balanceX <= 400)//if the game has not ended yet
  {
    balanceTime = balanceEnd - millis();//update the game time
    balanceAngle -= balanceX / 2500;//tilt the beam proportional to how far from the center you are
    balanceX -= balanceAngle;//slide the player proportional to how tilted the beam is
    
    background(200);
    stroke(0);
    strokeWeight(10);
    line(200, 400 + balanceAngle * 400, 1000, 400 - balanceAngle * 400);//draw the beam
    fill(100);
    noStroke();
    ellipse(600 + balanceX, 400 - balanceX * balanceAngle, 80, 80);//draw the player on the beam
    fill(255, 0, 0);
    text((int)balanceTime/1000, width/2, 650);
    text("Use the arrow keys to shift the weight.", width/2, 700);
    
    if (keyPressed)//make the player move if the arrow keys are pressed
    {
      switch(keyCode)
      {
      case LEFT:
        balanceX -= 4;
        break;
      case RIGHT:
        balanceX += 4;
      }
    }
  }
  else//if the game has ended
  {
    if(balanceX < -400 || balanceX > 400)//if you lost
    {
      p.loc.set(width/2, height/2);
      text("You have failed!", width/2, 100);
    }
    else//if you won
    {
      text("You have succeeded!", width/2, 100);
      if (!hasItem(4))
      {
        inventory.add(possibleItems[4]);
      }
    }
  }
}