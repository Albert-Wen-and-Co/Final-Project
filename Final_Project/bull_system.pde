class Bullsystem {

  ArrayList <Bulls> bull =new ArrayList<Bulls>();
  int scb;
  
  //variables for timer
  String time;
  int t;
  int count=35;
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
      bull.add(new Bulls(random(width), random(height/4)));
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
    fill(255);
    textFont(font, 15);
    textAlign(CENTER);
    text("Time Remaining:", 520, 720);
    fill(255, 0, 0);
    textFont(font, 45);
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

    if (t <= 0) //if the time runs out, display the game over text 
    {
      gameScreenB=2;
    }
  }

  void gameOverScreenB() { //if the score is greater than -5. add a key to the inventory
    if (scb>= -5) {
      textFont(font, 45);
      text("congrats, you have recieved a KEY!", width/2, height/2);
      textAlign(CENTER);
      if (!hasItem(1))
      {
        inventory.add(possibleItems[1]);
      }
    } else { //if not, display sorry text
      text("sorry, try again another time", width/2, height/2);
    }
  }

  void startGameB() { //set variable to start the game
    gameScreenB=1;
  }

  void mousePressed() { //the game will start if the mouse is pressed on the initial screen
  }
} //end of bull class parentheses