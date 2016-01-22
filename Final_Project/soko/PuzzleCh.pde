class PuzzleCh {
  int x; 
  int y;
  int mapw;
  int maph;

  PuzzleCh(int tx, int ty, PuzzleSystem p) {
    x = tx;
    y = ty;
    mapw = p.x;
    maph = p.h;
  }

  void move() {
    switch(keyCode)
    {
    case UP:
      if (y > 0)
      {
        y-=1;
      }
      break;
    case DOWN:
      if (y < maph-1)
      {
        y+=1;
      }
      break;
    case LEFT:
      if (x > 0)
      {
        x-=1;
      }
      break;
    case RIGHT:
      if (x < mapw-1)
      {
        x+=1;
      }
    }
  }
}