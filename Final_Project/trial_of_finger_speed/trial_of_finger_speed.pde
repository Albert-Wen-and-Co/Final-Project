int score=0;
float time=10;
boolean start=false;
float startTime;
PImage origami;
int goal = 70; //goal #clicks

void setup() {
  size(1200, 800);
  origami=loadImage("origami.png");
  origami.resize(100, 100);
  imageMode(CENTER);
  textAlign(CENTER);
}

void draw() {
  if (!start) {
    startTime = millis();
  }

  background(255, 217, 179);
  textSize(55);

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
    image(origami, mouseX, mouseY);
  }
}