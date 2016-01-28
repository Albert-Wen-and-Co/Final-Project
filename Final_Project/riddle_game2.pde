int riddleNumber; //create a variable for the riddle number

void riddleSetup() {

  riddleNumber = 1; //each value for riddleNumber corresponds with a new question
}

void riddleDraw() {
  background(203, 179, 255);
  fill(150, 102, 255);
  rect(0,0,1200,400);
  fill(0);
  textSize(32);
  textAlign(CENTER);
  
  if(riddleNumber == 1) //if the value=1 the first question will show
  {
    text("See if you can complete this sequence:", 600, 150); //draw question and answer options
    text("1=3, 2=3, 3=5, 4=4, 5=4, 6=3,", 600, 200);
    text("7=5, 8=5, 9=4, 10=3, 11=?, 12=?",600,250);
    text("13, 12", 200, 500);
    text("6, 6", 600, 500); //this is the correct answer
    text("10, 24", 200, 700);
    text("6 ,5", 600, 700);
  }
  else if(riddleNumber == 2)//if the value=2. the second question will show
  {
    text("A man fell into a hole that was 14.5 feet deep.", 600, 150);
    text("He could jump three feet, but he slid",600,200);
    text("a foot everytime he jumped",600,250);
    text("How many jumps does it take for him to escape the hole?",600,300);
    text("8", 200, 500);
    text("7", 600, 500); //this is the correct answer
    text("this is a trick!", 200, 700);
    text("9", 600, 700);
  }
  else if(riddleNumber == 3)//if the value=3. the third question will show
  {
    text("What is the next number in this series?", 600, 150);
    text("4, 6, 12, 18, 30, 42, 60, 72, 102, 108,...",600,200);
    text("114", 200, 500);
    text("138", 600, 500); //this is the correct answer
    text("120", 200, 700);
    text("136", 600, 700);
  }
  else if(riddleNumber == 4)
  {
    text("You answered all the riddles correctly!", 600, 150); //if all the questions are answered correctly, a key is added to the players inventory
    text("You got a key!", 600, 200);
    if (!hasItem(3))
    {
      inventory.add(possibleItems[3]); 
    }
  }
  else if(riddleNumber == 5) //if a question was answered wrong, a sorry screen displays and the player is returned back to the main screen
  {
    text("Your answer was wrong! Try again!", 600, 150);
    p.loc.set(width/2, height/2);
  }
}