class Card
{
  boolean up;
  int id;
  PVector pos = new PVector();
  
  //creates card with desired id
  Card(int tID) {
    up = false;
    id = tID;
    pos.set(random(width-40),random(height-40));
  }
  
  Card(float x, float y, int tID) {
    up = false;
    id = tID;
    pos.set(x,y);
  }
  
  //flips the card
  void flip() {
    up = !up;
    return;
  }
  
  //for now it just shows its number, but this should at some point change
  void display() {
    if(up) {
      fill(255);
      rect(pos.x,pos.y,40,40);
      textAlign(CENTER);
      fill(0);
      text(id,pos.x+20,pos.y+20);
    }
    else {
      fill(255,0,0);
      rect(pos.x,pos.y,40,40);
    }
    return;
  }
  
  boolean touches(float x,float y) {
    return x>pos.x&&x<pos.x+40&&y>pos.y&&y<pos.y+40;
  }
}