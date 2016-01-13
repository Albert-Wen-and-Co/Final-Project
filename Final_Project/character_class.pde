class Charact {
  PVector loc;
  float diam;
  
  Charact(float x, float y) {
    loc = new PVector (x, y);
    diam = 40;
  }
  
  void display(){
    fill(255,0,0);
    ellipse(loc.x,loc.y,diam,diam);
  }
  
  void move(){
    if(keyPressed)
    {
      switch(keyCode)
      {
        case UP:
          loc.y -= 4;
          break;
        case DOWN:
          loc.y += 4;
          break;
        case LEFT:
          loc.x -= 4;
          break;
        case RIGHT:
          loc.x += 4;
      }
    }
  }
  
  boolean contact(PVector loc2) {
    if(loc.dist(loc2) < diam) {
      return true;
    } return false;
  }
    
}
  
  