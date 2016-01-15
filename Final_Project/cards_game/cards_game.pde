ArrayList<Card> cards = new ArrayList<Card>();
ArrayList<Card> faceUp = new ArrayList<Card>();
int moves = 0;
void setup() {
  size(800, 600);
  for (int i = 0; i<5; i++) {
    Card a = new Card(100, 60*i, i);
    cards.add(a);
  }

  for (int i = 0; i<5; i++) {
    Card a = new Card(300, 60*i, i);
    cards.add(a);
  }
}


void draw() {
  background(0);
  
  //display of cards
  for (int i = cards.size()-1; i >=0; i--) {
    Card c = cards.get(i);
    c.display();
    if (c.up) {
      faceUp.add(c);
    }
  }
  
  //test if the two cards face up are same. If they are, then both cards are removed from original arraylist.
  
  if (faceUp.size() >=2) {
    if (faceUp.get(0).equals(faceUp.get(1))) {
      for (int j = cards.size()-1; j >=0; j--) {
        Card d = cards.get(j);
        if (d.id == faceUp.get(0).id) {
          cards.remove(j);
        }
      }
    }
  }
  faceUp.clear();
}

void mouseClicked() {
  for (int i = cards.size()-1; i >=0; i--) {
    Card c = cards.get(i);
    if (c.touches(mouseX, mouseY)) { //flips card when touching
      if (moves%2==0) { //if two cards already up, flips them over before continuing.
        for (int j = cards.size()-1; j >=0; j--) {
          Card d = cards.get(j);
          if (d.up) {
            d.flip();
          }
        }
      }
      c.flip();
      moves+=1;
    }
  } 
}