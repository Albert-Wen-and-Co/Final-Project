int fScore =  0; //#clicks
float fTime = 10; //fTime given
int fGoal = 70; //goal #clicks
boolean fStart = false; //whether fTimer is started
float fStartTime; //fTime at start of fTimer (since millis() returns fTime since start of program)


void fDraw() {
  background(218, 255, 179);
  if (!fStart) { //if the timer is started, then this will display
    fStartTime = millis();
    fill(26, 51, 0); //display text
    textFont(font, 45);
    text("Time Alloted: 10 seconds", width/2, height*3/4);
    textAlign(CENTER);
  }
  fill(26, 51, 0);
  text("Goal: "+ fGoal, width/2, height*1/4);
  text("#clicks: "+ fScore, width/2, height/2);

  if (fStart) { //if the timer is started, it will start to count down
    if (fTime+fStartTime/1000-millis()/1000.0>=0) {
      text("Time Remaining: " + ceil(1000*fTime+fStartTime-millis())/1000.0 +"seconds", width/2, height*3/4);
    } else { 
      fill(26, 51, 0);
      text("Time Remaining: 0", width/2, height*3/4);
      textAlign(CENTER);
      if (fScore >= fGoal && !hasItem(2)) //if the goal is reached then a key will be added to the inventory
      {
        inventory.add(possibleItems[2]);
      }
    }
  }
}