//declare variables
float playerX, playerY;
Charact c;
Bullsystem bs;
Charact p;
NPC[] people = new NPC[5];
Item[] possibleItems = new Item[5];
ArrayList<Item> inventory = new ArrayList<Item>();

PImage keys;
PImage character;
PImage logo;
PFont font;
PImage map;

int gameScreen=0; //the correct screen is determined by the value of the variable, 0= initial screen, 1=game screen, 2=game over screen

void setup() {
  size(1200, 800);//set up canvas size

  font=loadFont("HVDBodedo.vlw"); //load fonts and images
  character=loadImage("character.png");
  character.resize(60, 50);
  character=loadImage("character down.png");
  character.resize(60, 50);
  logo=loadImage("mapquest(HVD).png");
  map=loadImage("mapbackground.jpg");
  map.resize(1200, 800);
  imageMode(CENTER);

  p = new Charact(width/2, height/2);//initialize variables
  people[0] = new NPC(100, 100);
  people[1] = new NPC(800, 100);
  people[2] = new NPC(200, 400);
  people[3] = new NPC(150, 300);
  people[4] = new NPC(900, 500);
  keys = loadImage("key.png");
  for (int i = 0; i < possibleItems.length; i++)
  {
    possibleItems[i] = new Item(keys);
  }
}

void draw()
{
  if (gameScreen == 0) { //if the value of variable is #, then the coresponding screen will show
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}


void initScreen() { 
  fill(255);
  rect(0, 0, 1200, 800);
  image(logo, width/2, 300);
  fill(0);
  textFont(font, 25);
  text("INSTRUCTIONS: use the arrow keys to travel around the map ", width/2, 500);
  text("and play the minigames at each location to collect the keys.", width/2, 530);
  text("collect all keys to unlock the temple and win the game!", width/2, 560);
  fill(255, 0, 0);
  textFont(font, 25);
  text("click anywhere to start!", width/2, 600);
  textAlign(CENTER);
}


void gameScreen() {
  background(0);//draw the background and sidebar
  image(map, width/2, height/2);
  fill(150);
  rect(1050, 0, width, height);

  p.display();
  p.move();

 for (int i = 0; i < people.length; i++)//draw each NPC
  {
    people[i].display();
  }

  for (int i = 0; i < people.length; i++)//check if the player is in contact with an NPC
  {
    if (p.contact(people[i].loc))
    {
      fill(0);//replace this with something that starts a minigame
      rect(0, 0, width, 50);
      if (!hasItem(i))
      {
        inventory.add(possibleItems[i]);
      }
    }
  }
  for (int i = 0; i < inventory.size(); i++)
  {
    Item tempItem = inventory.get(i);
    tempItem.display(1100, 100 + 100 * i);
  }
}

boolean hasItem(int index)
{
  for (int i = 0; i < inventory.size(); i++)
  {
    Item tempItem = inventory.get(i);
    if (tempItem == possibleItems[index])
    {
      return true;
    }
  }
}

void gameOverScreen() {
}

void startGame() { //set variable to start the game
  gameScreen=1;
}

public void mousePressed() { //the game will start if the mouse is pressed on the initial screen
  if (gameScreen==0) {
    startGame();
  }
}