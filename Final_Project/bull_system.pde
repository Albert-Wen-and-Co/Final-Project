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
  PImage bullcharacter;


  Bullsystem() { 
    scb=0; //delcare and italize variable for scoring 
    t = 1;
    interval=30;
    mouse = new PVector();
    for (int i = 0; i < count; i++)
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
    textAlign(CENTER);
    text("move your character to dodge", width/2, 300);
    text("any oncoming objects!", width/2, 350);
    text("get hit less than 5 times and get the key!", width/2, 400);
    text("click to start!", width/2, 450);
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

    textSize(15);
    text("Time Remaining:", 520, 720);
    fill(255, 0, 0);
    textSize(45);
    text(t, 645, 730); //display the time remaining

    t = interval-int((millis()-startTime)/1000); //the clock will count down every second from the given interval


    image(bullcharacter, mouseX, mouseY);

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
      textAlign(CENTER);
      text("Congrats! You have recieved a KEY!", width/2, height/2);
      if (!hasItem(1))
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
} //end of bull class parentheses