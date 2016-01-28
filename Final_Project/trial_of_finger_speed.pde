int fScore =  0; //#clicks
float fTime = 10; //fTime given
int fGoal = 70; //goal #clicks
boolean fStart = false; //whether fTimer is started
float fStartTime; //fTime at start of fTimer (since millis() returns fTime since start of program)
PImage origami;

void fSetup()
{
  origami=loadImage("origami.png");
  origami.resize(100, 100);
  imageMode(CENTER);
  textAlign(CENTER);
  fill(255);
  textSize(55);
}
void fDraw() {
  background(255, 217, 179);
  
  if (!fStart) {
    fStartTime = millis();
    text("Time Alloted: 10 seconds", width/2, height*3/4);
    fScore =  0;
    fTime = 10;
  }
  
  text("Goal: "+ fGoal, width/2, height*1/4);
  text("#clicks: "+ fScore, width/2, height/2);

  if (fStart)
  {
    if (fTime+fStartTime/1000-millis()/1000.0>=0)
    {
      text("Time Remaining: " + ceil(1000*fTime+fStartTime-millis())/1000.0 +"seconds", width/2, height*3/4);
    }
    else
    { 
      text("Time Remaining: 0", width/2, height*3/4);
      if (fScore < fGoal)
      {
        p.loc.set(width/2, height/2);
      }
      else if (!hasItem(2))
      {
        inventory.add(possibleItems[2]);
      }
    }
  }
}

/*void mouseClicked() {
 start = true; //fTimer starts at 1st click
 
 if (fTime+startTime/1000-millis()/1000.0>=0) { //you can't increase fScore after the end of the fTimer.
 fScore+=1;
 }
 }
 */