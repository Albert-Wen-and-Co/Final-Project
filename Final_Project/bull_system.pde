class Bullsystem {

  ArrayList <Bulls> bull =new ArrayList<Bulls>();
  int scb;
  String time;
  int t;
  int count=20;
  int interval;
  PVector mouse;
  int gameScreenB=0;


  Bullsystem() { 
    scb=0; //delcare and italize variable for scoring 

    time="32"; //create a string and interval to later create a countdown clock
    t = 0;
    interval=32;
    mouse = new PVector();
    for(int i = 0; i < count; i++)
    {
      bull.add(new Bulls(random(width), random(height/4)));
    }
  }

  void run() {
    if (gameScreenB == 0) { //if the value of variable is #, then the coresponding screen will show
      initScreenB();
    } else if (gameScreenB == 1) {
      mainScreenB();
    } else if (t==0) { //when the time runs out, displat the game over screen
      gameOverScreenB();
    }
  }

  void initScreenB() {
    //create a welcome screen
    fill(0);
    rect(0, 0, 1200, 800);
    textFont(font, 45);
    fill(255);
    text("move your character to dodge any oncoming objects!", width/2, 300);
    text("get hit less than 5 times and get the key! click to start!", width/2, 400);
  }

  void mainScreenB() {
    background(0);
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
    textFont(font, 15);
    textAlign(CENTER);
    text("Time Remaining:", 550, 730);
    fill(255, 0, 0);
    textFont(font, 45);
    text(t, 645, 730); //display the time remaining

    t = interval-int(millis()/1000); //the clock will count down every second from the given interval
    time = nf(t, 3);

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
  }

  void gameOverScreenB() {
    if (scb>= -5) {
      textFont(font, 45);
      text("congrats, you have recieved a KEY!", width/2, height/2);
      textAlign(CENTER);
    } else { 
      text("sorry, try again another time", width/2, height/2);
    }
  }

  void startGameB() { //set variable to start the game
    gameScreenB=1;
  }

  void mousePressed() { //the game will start if the mouse is pressed on the initial screen
    
  }
} //end of bull class parentheses