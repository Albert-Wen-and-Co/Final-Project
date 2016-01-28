//create an array for the cards 
ArrayList<Card> cards = new ArrayList<Card>();
ArrayList<Card> faceUp = new ArrayList<Card>();
int moves = 0;

void cardsSetup() {
  //draw cards at location with a different number on the back of each one
  cards.add(new Card(150, 150, 5));
  cards.add(new Card(400, 150, 4));
  cards.add(new Card(650, 150, 1));
  cards.add(new Card(900, 150, 2));
  
  cards.add(new Card(150, 300, 1));
  cards.add(new Card(400, 300, 3));
  cards.add(new Card(650, 300, 2));
  cards.add(new Card(900, 300, 6));
  
  cards.add(new Card(150, 450, 6));
  cards.add(new Card(400, 450, 4));
  cards.add(new Card(650, 450, 3));
  cards.add(new Card(900, 450, 5));
}


void cardsDraw() {
  background(179, 214, 255);
  //fill(0);
  //textFont(font,35);
  //text("Match up all the cards!",width/2, 720);
  //textAlign(CENTER);

  
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
          if(cards.size() == 0){ //if all the cards have been removed from the array(size=0), a key is added to the inventory
            inventory.add(possibleItems[0]);
            gameScreen = 1;
          }
        }
      }
    }
  }
  faceUp.clear();
}