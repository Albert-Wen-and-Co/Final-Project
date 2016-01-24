ArrayList<Card> cards = new ArrayList<Card>();
ArrayList<Card> faceUp = new ArrayList<Card>();
int moves = 0;
void cardsSetup() {
  cards.add(new Card(100, 100, 5));
  cards.add(new Card(200, 100, 4));
  cards.add(new Card(300, 100, 1));
  cards.add(new Card(400, 100, 2));
  
  cards.add(new Card(100, 200, 1));
  cards.add(new Card(200, 200, 3));
  cards.add(new Card(300, 200, 2));
  cards.add(new Card(400, 200, 6));
  
  cards.add(new Card(100, 300, 6));
  cards.add(new Card(200, 300, 4));
  cards.add(new Card(300, 300, 3));
  cards.add(new Card(400, 300, 5));
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