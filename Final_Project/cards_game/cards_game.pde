ArrayList<Card> cards = new ArrayList<Card>();
void setup() {
  size(800,600);
  for (int i = 0; i<40; i++) {
    Card a = new Card(i);
    cards.add(a);
  }
}


void draw() {
  background(0);
  for (int i = cards.size()-1; i >=0; i--) {
    Card c = cards.get(i);
    c.display();
  }
}

void mouseClicked() {
  for (int i = cards.size()-1; i >=0; i--) {
    Card c = cards.get(i);
    c.flip();
  }
}