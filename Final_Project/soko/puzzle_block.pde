class PuzzleSystem {
  int[][] map;
  int x;
  int y;
  int playerX;
  int playerY;

  PuzzleSystem(int tx, int ty) {
    x = tx;
    y = ty;
    map = new int[tx][ty];
    
    //index numbers: 0 is floor, 1 is wall, 2 is boulder, 3 is goal squares, 4 is PC
  }
  void puzzSetup() {
    for (int i =0; i<tx; i++) {
      for (int j = 0; j<ty; j++) {
        map[i][j] = 0;
      }
    }
    map[0][0] = 4;
    map[2][3] = 1;
    playerX = 0;
    playerY = 0;
  }
  
  void display() {
    for (int i =0; i<x; i++) {
      for (int j = 0; j<y; j++) {
        switch(map[i][j]) {
        case 0:
          fill(255);
          break;
        case 1:
          fill(0);
          break;
        case 2:
          fill(100);
          break;
        case 4:
          fill(255, 0, 0);
          break;
        }
        rect(10*i, 10*j, 10, 10);
      }
    }
    //different colors for different types
  }
  void update() {
    puzzSetup();
  }
}