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
    for(int i =0; i<tx; i++) {
      for (int j = 0; j<ty; j++) {
        map[i][j] = 0;
      }
    }
    map[0][0] = 4;
    playerX = 0;
    playerY = 0;
  }

  void display() {
    for(int i =0; i<x; i++) {
      for (int j = 0; j<y; j++) {
        switch(map[i][j]) {
          case 0:
            fill(255);
            break;
          case 4:
            fill(255,0,0);
            break;
        }
        rect(10*i,10*j,10,10);
      }
    }
  }
  
  void move() {
      switch(keyCode)
      {
      case UP:
        if (playerY > 0)
        {
          map[playerX][playerY] = 0;
          map[playerX][playerY-1] = 4;
          playerY-=1;
        }
        break;
      case DOWN:
        if (playerY < y-1)
        {
          map[playerX][playerY] = 0;
          map[playerX][playerY+1] = 4;
          playerY+=1;
        }
        break;
      case LEFT:
        if (playerX > 0)
        {
          map[playerX][playerY] = 0;
          map[playerX-1][playerY] = 4;
          playerX-=1;
        }
        break;
      case RIGHT:
        if (playerX < x-1)
        {
          map[playerX][playerY] = 0;
          map[playerX+1][playerY] = 4;
          playerX+=1;
        }
      }
    }
  }