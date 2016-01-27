int riddleNumber;

void riddleSetup() {

  riddleNumber = 1;
}

void riddleDraw() {

  background(255);
  
  fill(0);

  textSize(32);
  textAlign(CENTER);
  if(riddleNumber == 1)
  {
    text("12 * 13 =", 600, 150);
    text("121", 200, 500);
    text("156", 600, 500);
    text("173", 200, 700);
    text("182", 600, 700);
  }
  else if(riddleNumber == 2)
  {
    text("9 * 9 =", 600, 150);
    text("121", 200, 500);
    text("81", 600, 500);
    text("173", 200, 700);
    text("182", 600, 700);
  }
  else if(riddleNumber == 3)
  {
    text("2 * 2 =", 600, 150);
    text("121", 200, 500);
    text("4", 600, 500);
    text("173", 200, 700);
    text("182", 600, 700);
  }
  else if(riddleNumber == 4)
  {
    text("You answered all the riddles correctly!", 600, 150);
    text("You got a key!", 600, 200);
    if (!hasItem(3))
    {
      inventory.add(possibleItems[3]);
    }
  }
  else if(riddleNumber == 5)
  {
    text("Your answer was wrong!", 600, 150);
    p.loc.set(width/2, height/2);
  }
}