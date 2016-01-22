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
PImage temple1;
PImage temple2;
PImage temple3;
PImage temple4;
PImage temple5;
PImage goaltemple;

int gameScreen=0; //the correct screen is determined by the value of the variable, 0= initial screen, 1=game screen, 2=game over screen

void setup() {
  size(1200, 800);//set up canvas size

  font=loadFont("HVDBodedo.vlw"); //load fonts and images
  character=loadImage("character down.png");
  character.resize(60, 50);
  logo=loadImage("mapquest(HVD).png");
  map=loadImage("mapbackground.jpg");
  map.resize(1200, 800);
  temple1=loadImage("browntemple2.png");
  temple1.resize(100,70);
  temple2=loadImage("redtemple2.png");
  temple2.resize(100,90);
  temple3=loadImage("redtemple.png");
  temple3.resize(100,90);
  temple4=loadImage("browntemple.png");
  temple4.resize(100,70);
  temple5=loadImage("graytemple.png");
  temple5.resize(140,70);
  goaltemple=loadImage("goaltemple.png");
  goaltemple.resize(170,100);
  imageMode(CENTER);

  p = new Charact(width/2, height/2);//initialize variables
  people[0] = new NPC(115, 90, temple1);
  people[1] = new NPC(815, 275, temple2);
  people[2] = new NPC(255, 340, temple3);
  people[3] = new NPC(710, 595, temple4);
  people[4] = new NPC(425, 765, temple5);
  keys = loadImage("key.png");
  for (int i = 0; i < possibleItems.length; i++)
  {
    possibleItems[i] = new Item(keys);
  }
  bs = new Bullsystem();
}

void draw()
{
  if (gameScreen == 0) { //if the value of variable is #, then the coresponding screen will show
    initScreen();
  } else if (gameScreen == 1) {
    mainScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  } else if (gameScreen == 3) {
    cardsDraw();
  }
  else if(gameScreen == 4)
  {
    bs.run();
  }
  else if (gameScreen == 5) {
    fDraw();
  }
}

void initScreen() { 
  background(255);
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

void mainScreen(){
  background(0);//draw the background and sidebar
  image(map, width/2, height/2);
  fill(150);
  rect(1050, 0, width, height);
  
  image(goaltemple, 950, 475);

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
      textAlign(LEFT,TOP);
      fill(255);
      textSize(16);
      if (!hasItem(i))
      {
        switch(i)
        {
          case 0:
            text("Test your memory and ability in this challenge. Press z to accept.",8,8);
            if (key == 'z')
            {
              cardsSetup();
              gameScreen = 3;
            }
            break;
          case 1:
            text("I bet you can't dodge these objects! Press z to accept.",8,8);
            if (key == 'z')
            {
              bs.gameScreenB = 0;
              gameScreen = 4;
            }
            break;
          case 2:
            text("Do you think you have fast fingers? Press z to accept.",8,8);
            if (key == 'z')
            {
              gameScreen = 5;
            }
            break;
          case 3:
            if(!hasItem(3))
            {
              inventory.add(possibleItems[3]);
            }
            break;
          case 4:
            if(!hasItem(4))
            {
              inventory.add(possibleItems[4]);
            }
            break;
        }
      }
      else
      {
        switch(i)
        {
          case 0:
            text("Wow! You are so smart and intelligent and smart and smart. You may take my key.",8,8);
            break;
          case 1:
            text("I am impressed by your skills! Have a key!",8,8);
            break;
          case 2:
            text("Clickclickclickclickclick. Okay, I'll give you this key.",8,8);
            break;
          case 3:
            break;
          case 4:
            break;
        }
      }
    }
  }
  for (int i = 0; i < inventory.size(); i++)
  {
    Item tempItem = inventory.get(i);
    tempItem.display(1100, 100 + 100 * i);
  }
  if(hasItem(0) && hasItem(1) && hasItem(2) && hasItem(3) && hasItem(4))
  {
    gameScreen = 2;
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
  return false;
}

void gameOverScreen() {
  background(255);
  fill(0);
  textFont(font, 48);
  textAlign(CENTER, CENTER);
  text("Congratulations! You won!", width/2, height/2);
}

void startGame() { //set variable to start the game
  gameScreen=1;
}

void mouseClicked() {
  if (gameScreen==0) {
    startGame();
  } else if (gameScreen == 3) {
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
  } else if (gameScreen ==5) {
    fStart = true; //timer starts at 1st click

    if (fTime+fStartTime/1000-millis()/1000.0>=0) { //you can't increase score after the end of the timer.
      fScore+=1;
    }
    
    if(millis() - fStartTime > 10000)
    {
      gameScreen = 1;
    }
  }
  if(gameScreen == 4)
  {
    if (bs.gameScreenB==0) {
      bs.startGameB();
    }
    else if (bs.gameScreenB==2) {
      gameScreen = 1;
    }
  }
}