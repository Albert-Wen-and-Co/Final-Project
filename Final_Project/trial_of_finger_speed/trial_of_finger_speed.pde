int score =  0;
float time = 10;
boolean start = false;
float startTime;
void setup() {
  size(100, 100);
}
void draw() {
  if (!start) {
    startTime = millis();
  }
  background(0);
  text(score, width/2, height/2);
  if (time+startTime/1000-millis()/1000.0>=0) {
    text(time+startTime/1000-millis()/1000.0, width/2, height*3/4);
  } else { 
    text(0, width/2, height*3/4);
  }
}

void mouseClicked() {
  start = true;
  if (time+startTime/1000-millis()/1000.0>=0) {
    score+=1;
  }
}