int score =  0;
float time = 10;
boolean start = false;
float startTime;
void setup() {
  size(100,100);
}
void draw() {
  if(!start) {
    startTime = millis();
  }
  background(0);
  text(score, width/2,height/2);
  text(time+startTime/1000-millis()/1000.0,width/2,height*3/4);
}

void mouseClicked() {
  start = true;
  score+=1;
}