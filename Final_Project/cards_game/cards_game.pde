ArrayList<Card> cards = new ArrayList<Card>();
ArrayList<Integer> faceUpID = new ArrayList<Integer>();
ArrayList<Integer> faceUpInd = new ArrayList<Integer>();
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
  }
  
  //test if the two cards face up are same. If they are, then both cards are removed from original arraylist.
  if (faceUpID.size() >=2) {
    if (faceUpID.get(0).equals(faceUpID.get(1))) {
      int a = faceUpInd.get(1).intValue();
      int b = faceUpInd.get(0).intValue();
      if (a>b) {
        cards.remove(a);
        cards.remove(b);
      }
      else {
        cards.remove(b);
        cards.remove(a);
      }
    }
    faceUpID.clear();
    faceUpInd.clear();
  }
    println(faceUpInd.size());
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
      //adds c's info to these two arraylists after flipping.
      faceUpID.add(c.id);
      faceUpInd.add(i);
    }
  } 
}