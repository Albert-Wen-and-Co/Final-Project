ArrayList<Card> cards = new ArrayList<Card>();
ArrayList<Card> faceUp = new ArrayList<Card>();
int moves = 0;
void cardsSetup() {
  cards.add(new Card(400, 200, 5));
  cards.add(new Card(500, 200, 4));
  cards.add(new Card(600, 200, 1));
  cards.add(new Card(700, 200, 2));
  
  cards.add(new Card(400, 300, 1));
  cards.add(new Card(500, 300, 3));
  cards.add(new Card(600, 300, 2));
  cards.add(new Card(700, 300, 6));
  
  cards.add(new Card(400, 400, 6));
  cards.add(new Card(500, 400, 4));
  cards.add(new Card(600, 400, 3));
  cards.add(new Card(700, 400, 5));
}


void cardsDraw() {
  background(224,184,128);
  //rect(350,150,450,350);
  fill(0);
  textFont(font,35);
  text("match up all the cards!",width/2, 720);
  textAlign(CENTER);
  
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