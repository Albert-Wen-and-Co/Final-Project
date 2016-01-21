int score =  0; //#clicks
float time = 10; //time given
int goal = 70; //goal #clicks
boolean start = false; //whether timer is started
float startTime; //time at start of timer (since millis() returns time since start of program)
void setup() {
  size(500, 300);
  textAlign(CENTER);
}

void draw() {
  if (!start) {
    startTime = millis();
  }
  
  background(0);
  
  text("Goal: "+ goal,width/2,height*1/4);
  
  text("#clicks: "+ score, width/2, height/2);
  
  if (time+startTime/1000-millis()/1000.0>=0) {
    text("Time Remaining: " + ceil(1000*time+startTime-millis())/1000.0, width/2, height*3/4);
  } else { 
    text("Time Remaining: 0", width/2, height*3/4);
  }
}

void mouseClicked() {
  start = true; //timer starts at 1st click
  
  if (time+startTime/1000-millis()/1000.0>=0) { //you can't increase score after the end of the timer.
    score+=1;
  }
}