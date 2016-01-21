int count = 3;
float x = 100;
float y = 500;
ArrayList<Answer> answers = new ArrayList<Answer>();

Question q = new Question(); 

void riddleSetup(){
  
  q.display();
  for (int i = 0; i < count; i ++){
    
    
    answers.add(new Answer(x,y));

  }
}

void riddleDraw(){
  b.display(x,y);
  
  
}