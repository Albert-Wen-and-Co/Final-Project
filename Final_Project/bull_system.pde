class Bullsystem {
  ArrayList <Bulls> bull =new ArrayList<Bulls>(); //create an ArrayList
  int scb;
  
  //variables for timer
  String time;
  int t;
  int count=40;
  int interval;
  PVector mouse;
  float startTime=0;

  PImage bullcharacter;
  
  int gameScreenB=0;


  Bullsystem() { 
    scb=0; //delcare and italize variable for scoring 
    t = 1;
    interval=30;
    mouse = new PVector();
    for (int i = 0; i < count; i++) //create an array for the lanterns, have then 
    {
      bull.add(new Bulls(random(width), random(height/3)));
    }
    bullcharacter=loadImage("characterup2.png");
    bullcharacter.resize(60, 50);
  }

  void run() {
    if (gameScreenB == 0) { //if the value of variable is #, then the coresponding screen will show
      initScreenB();
    } else if (gameScreenB == 1) {
      mainScreenB();
    } else if (gameScreenB == 2) { //when the time runs out, display the game over text
      gameOverScreenB();
    }
  }

  void initScreenB() {
    //create a welcome screen
    fill(255, 204, 204);
    rect(0, 0, 1200, 800);
    textFont(font, 45);
    fill(0);
    textAlign(CENTER);
    text("move your character to dodge", width/2, 250);
    text("any falling objects!", width/2, 300);
    text("get hit less than 5 times", width/2, 350);
    text("and get the key!",width/2, 400);
    text("click to start!", width/2, 450);

    scb=0;
    t = 1;
    interval=30;
    startTime = millis();
  }

  void mainScreenB() {
    background(255, 204, 204);
    mouse.set(mouseX, mouseY);  //set value of mouse as mouseX,mouseY

    //create a scoreboard
    fill(0);
    textFont(font, 15);
    textAlign(CENTER);
    text("Score:", 550, 765);
    textSize(45);
    text(scb, 610, 770); //display the score

    //create a timer
    fill(0);
    textSize(15);
    textAlign(CENTER);
    text("Time Remaining:", 520, 720);
    fill(255, 0, 0);
    textSize(45);
    text(t, 645, 730); //display the time remaining

    t = interval-int((millis()-startTime)/1000); //the clock will count down every second from the given interval


    image(bullcharacter, mouseX, mouseY);

    for (int i=0; i<count; i++) { //create an array
      Bulls b=bull.get(i); //get the lanterns from the array
      b.fall();   //make the lantern fall to the bottom of the screen
      b.display();  //display the lantern
      if (b.isInContactWith(mouse)) {  //check to see if the lantern is in contact with the character
        b.reset(); //if it is, reset the lantern
        scb=scb-1;  //if a lantern hits the character, the player looses a point
      }
      if (b.loc.y > height + b.diam/2) {     //check to see if the lantern goes below the bottom of the screen
        b.reset();                           //if it does, it resets
      }
    }

    
    if(t <= 0 || scb <= -5) //if the timer runs out OR the score is less than -5, give gameScreenB a value of 2 and display game over screen

    {
      gameScreenB=2;
    }
  }


  void gameOverScreenB() { //if the players score is greater than or equal to -5, add a key to their inventory
    if (scb > -5) {
      textFont(font, 45);
      textAlign(CENTER);
      fill(0);
      text("Congrats! You have recieved a KEY!", width/2, height/2);
      if (!hasItem(1))
      {
        inventory.add(possibleItems[1]);
      }

    } else { 
      p.loc.set(width/2, height/2); //if the score is less than -5. display a sorry screen and return the player back to the main screen
      text("Sorry. Try again another time.", width/2, height/2);

    }
  }

  void startGameB() { //set variable to start the game
    gameScreenB=1;
  }
} //end of bull class parentheses