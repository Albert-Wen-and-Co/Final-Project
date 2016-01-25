class Card
{
  boolean up;
  int id;
  PVector pos = new PVector();
  PImage cardback=loadImage("cardback.jpg");

  //creates card with desired id
  Card(int tID) {
    up = false;
    id = tID;
    pos.set(random(width-65),random(height-65));
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
  
  //draw card when face is up
  void display() { 
    if(up) {
      fill(255); 
      rect(pos.x,pos.y,100,130);
      textAlign(CENTER,CENTER);
      textSize(35);
      fill(0);
      text(id,pos.x+50,pos.y+65);
    }
    else { //draw card when face is down
      fill(0, 106, 179);
      stroke(255);
      strokeWeight(3);
      rect(pos.x,pos.y,100,130);
      //display card pattern background (because texture only works w/ vertices)
      image(cardback,200,215); 
      image(cardback,450,215);
      image(cardback,700,215);
      image(cardback,950,215);
      
      image(cardback,200,365);
      image(cardback,450,365);
      image(cardback,700,365);
      image(cardback,950,365);
      
      image(cardback,200,515);
      image(cardback,450,515);
      image(cardback,700,515);
      image(cardback,950,515);
      imageMode(CENTER);
      
    }
  }
  
  //check to see if the mouse is within the card boundaries
  boolean touches(float x,float y) { 
    return x>pos.x&&x<pos.x+100&&y>pos.y&&y<pos.y+130;
  }
  
  //check to see if the cards match
  boolean equals(Card a) { 
    return a.id == id;
  }
}