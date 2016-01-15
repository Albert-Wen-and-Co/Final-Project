Class bullsystem {
  int scb=0; //delcare and italize variable for scoring 

  String time="32"; //create a string and interval to later create a countdown clock
  int t;
  int interval=32;
}

void run() {
  mouse.set(mouseX, mouseY);  //set value of mouse as mouseX,mouseY

  //create a welcome screen
  //fill(0);
  //rect(0,0,1200,800);
  //image(rules,width/2,height/2);


  //if (t<=30) { //allow the welcome screen to appear for 2 seconds before the game begins
  //background(255);
  //}

  //create a scoreboard
  fill(0);
  textSize(15);
  textAlign(CENTER);
  text("Score:", 550, 765);
  textSize(45);
  text(sc, 610, 770); //display the score

  //create a timer
  fill(0);
  textSize(15);
  textAlign(CENTER);
  text("Time Remaining:", 550, 730);
  fill(255, 0, 0);
  textSize(45);
  text(t, 645, 730); //display the time remaining

  t = interval-int(millis()/1000); //the clock will count down every second from the given interval
  time = nf(t, 3);

  c.update();
  c.display(600, 700); {
    if (keyPressed) {
      switch(keyCode) {
      case LEFT:
        playerX -= 5;
        break;
      case RIGHT:
        playerX += 5;
      }
    }
  }




  for (int i=0; i<count; i++) { //create an array
    Bulls b=bull.get(i); //get the bulls from the array
    b.fall();   //make the bull run to the bottom of the screen
    b.display();  //display the raindrop
    if (b.isInContactWith(c)) {  //check to see if the bull is contact with the character
      b.reset(); //if it is, reset the bull
      scb=scb-1;  //if a bull hits the character, the player looses a point
    }
    if (b.loc.y > height + b.diam/2) {     //check to see if the bull goes below the bottom of the screen
      b.reset();                           //if it does, it
    }
  }
}