PuzzleSystem puz = new PuzzleSystem(24,14);
void setup() {
  size(240,140);
}

void draw() {
  puz.display();
  print(puz.playerX); println(puz.playerY);
}

void keyPressed() {
    puz.move();
}