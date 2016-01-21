ArrayList<Card> cards = new ArrayList<Card>();
ArrayList<Card> faceUp = new ArrayList<Card>();
int moves = 0;
void cardsSetup() {
  for (int i = 0; i<7; i++) {
    Card a = new Card(100*(i+1), 100, i);
    cards.add(a);
  }

  for (int i = 0; i<7; i++) {
    Card a = new Card(100*(i+1), 200, i);
    cards.add(a);
  }
}


void cardsDraw() {
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
          if(cards.size() == 0){
            inventory.add(possibleItems[0]);
            gameScreen = 1;
          }
        }
      }
    }
  }
  faceUp.clear();
}