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
  }
  
  //for now it just shows its number, but this should at some point change
  void display() {
    if(up) {
      fill(255);
      rect(pos.x,pos.y,60,80);
      textAlign(CENTER,CENTER);
      textSize(35);
      fill(0);
      text(id,pos.x+30,pos.y+40);
    }
    else {
      fill(0, 106, 179);
      stroke(255);
      strokeWeight(3);
      rect(pos.x,pos.y,60,80);
    }
  }
  
  boolean touches(float x,float y) {
    return x>pos.x&&x<pos.x+60&&y>pos.y&&y<pos.y+80;
  }
  
  boolean equals(Card a) {
    return a.id == id;
  }
}