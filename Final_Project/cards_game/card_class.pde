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
  
  //flips the card
  void flip() {
    up = !up;
    return;
  }
  
  //for now it just shows its number, but this should at some point change
  void display() {
    fill(255);
    rect(pos.x,pos.y,40,40);
    if(up) {
      textAlign(CENTER);
      fill(0);
      text(id,pos.x+20,pos.y+20);
    }
    return;
  }
  
}