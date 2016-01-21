int score=0;
float time=10;
boolean start=false;
float startTime;
PImage origami;

void setup() {
  size(1200, 800);
  origami=loadImage("origami.png");
  origami.resize(100, 100);
  imageMode(CENTER);
}

void draw() {
  if (!start) {
    startTime = millis();
  }
  background(255, 217, 179);
  textSize(55);
  text(score, width/2, height/2);
  text(time+startTime/1000-millis()/1000.0, width/2, 500);
}

void mouseClicked() {
  start = true;
  score+=1;
  image(origami, mouseX, mouseY);
}