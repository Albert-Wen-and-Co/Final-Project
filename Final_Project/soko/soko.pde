PuzzleSystem puz = new PuzzleSystem(24,14);
void setup() {
  size(240,140);
  puz.puzzSetup;
}

void draw() {
  puz.display();
}

void keyPressed() {
    puz.move();
}