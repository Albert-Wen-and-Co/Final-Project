Class Charact {
  PVector loc;
  float diam;
  
  Charact(float x, float y) {
    x = loc.x;
    y = loc.y;
  loc = new PVector (float x,float y);
  diam = 40;
  }
  
  void display(float playerX, float playerY){
    fill(255,0,0);
    ellipse(loc.x,loc.y,diam,diam);
  }
  
  void update(){
   loc.set(loc.x,loc.y); 
  }
  
  void move(){
    
    if(keyPressed)
  {
    switch(keyCode)
    {
      case UP:
        playerY -= 4;
        break;
      case DOWN:
        playerY += 4;
        break;
      case LEFT:
        playerX -= 4;
        break;
      case RIGHT:
        playerX += 4;
    }
  }
  
   boolean contact(PVector loc) {
    if(loc.dist(loc) < diam/2) {
      return true;
    } return false;
    
  }
    
  }
  
  