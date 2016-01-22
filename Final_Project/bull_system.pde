class Bullsystem {

  ArrayList <Bulls> bull =new ArrayList<Bulls>();
  int scb;
  String time;
  int t;
  int count=40;
  int interval;
  PVector mouse;
  int gameScreenB=0;
  float startTime=0;

  Bullsystem() { 
    scb=0; //delcare and italize variable for scoring 
    t = 1;
    interval=30;
    mouse = new PVector();
    for(int i = 0; i < count; i++)
    {
      bull.add(new Bulls(random(width), random(height/3)));
    }
  }

  void run() {
    if (gameScreenB == 0) { //if the value of variable is #, then the coresponding screen will show
      initScreenB();
    } else if (gameScreenB == 1) {
      mainScreenB();
    } else if (gameScreenB == 2) { //when the time runs out, displat the game over screen
      gameOverScreenB();
    }
  }

  void initScreenB() {
    //create a welcome screen
    fill(0);
    rect(0, 0, 1200, 800);
    textFont(font, 30);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Move your character to dodge any oncoming objects!", width/2, 300);
    text("Get hit less than 5 times and get the key! Click to start!", width/2, 400);
    scb=0;
    t = 1;
    interval=30;
    startTime = millis();
  }

  void mainScreenB() {
    background(0);
    mouse.set(mouseX, mouseY);  //set value of mouse as mouseX,mouseY

    //create a scoreboard
    fill(255);
    textFont(font, 15);
    textAlign(CENTER);
    text("Score:", 550, 765);
    textSize(45);
    text(scb, 610, 770); //display the score

    //create a timer
    textFont(font, 15);
    textAlign(CENTER);
    text("Time Remaining:", 520, 720);
    fill(255, 0, 0);
    textFont(font, 45);
    text(t, 645, 730); //display the time remaining

    t = interval-int((millis()-startTime)/1000); //the clock will count down every second from the given interval

    image(character, mouseX, mouseY);

    for (int i=0; i<count; i++) { //create an array
      Bulls b=bull.get(i); //get the bulls from the array
      b.fall();   //make the bull run to the bottom of the screen
      b.display();  //display the raindrop
      if (b.isInContactWith(mouse)) {  //check to see if the bull is contact with the character
        b.reset(); //if it is, reset the bull
        scb=scb-1;  //if a bull hits the character, the player looses a point
      }
      if (b.loc.y > height + b.diam/2) {     //check to see if the bull goes below the bottom of the screen
        b.reset();                           //if it does, it resets
      }
    }
    
    if(t <= 0 || scb <= -5)
    {
      gameScreenB=2;
    }
  }

  void gameOverScreenB() {
    if (scb > -5) {
      textFont(font, 45);
      text("Congrats! You have recieved a KEY!", width/2, height/2);
      textAlign(CENTER);
      if(!hasItem(1))
      {
        inventory.add(possibleItems[1]);
      }
    } else { 
      p.loc.set(width/2, height/2);
      text("Sorry. Try again another time.", width/2, height/2);
    }
  }

  void startGameB() { //set variable to start the game
    gameScreenB=1;
  }

  void mousePressed() { //the game will start if the mouse is pressed on the initial screen
    
  }
} //end of bull class parentheses