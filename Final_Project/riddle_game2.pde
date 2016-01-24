PVector mouse;
int count = 4;
ArrayList <Answer> answers = new ArrayList <Answer>();

void riddleSetup() {
  mouse = new PVector();

  answers.add(new Answer(100, 400));
  answers.add(new Answer(500, 400));
  answers.add(new Answer(100, 600));
  answers.add(new Answer(500, 600));
}

void riddleDraw() {

  background(255);

  for (int i = 0; i < count; i++) {
    Answer a = answers.get(i);
    a.display();
  }
  
  fill(0);

  textSize(32);
  textAlign(CENTER);
  text("12 * 13 =", 600, 150);
  text("121", 200, 500);
  text("156", 600, 500);
  text("173", 200, 700);
  text("182", 600, 700);
}