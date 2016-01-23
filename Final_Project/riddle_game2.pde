PVector mouse;
int count = 4;
ArrayList <Answer> answers = new ArrayList <Answer>();

void settings(){
  size(1200,800);
}

void setup(){
  fill(255);
  rect(100,100,1000,300);
  
  mouse = new PVector();
  
  for(int i = 0; i < count; i++){
    fill(255);
    answers.add(new Answer(100,400));
    answers.add(new Answer(500,400));
    answers.add(new Answer(100,600));
    answers.add(new Answer(500,600));
  }
  
  

}

void draw(){
  
  answers.add(new Answer(100,400));
   answers.add(new Answer(500,400));
    answers.add(new Answer(100,600));
    answers.add(new Answer(500,600));
    
    for(int i = 0; i < count; i++){
      Answer a = answers.get(i);
      a.display();
      

    
  }
      
    }
    
    fill(0);
    
 

  textSize(32);
  textAlign(CENTER);
  text("12 * 13 =",600,150);
  text("121",200,500);
  text("156",600,500);
  text("173",200,700);
  text("182",600,700);
  
    
  }



}
