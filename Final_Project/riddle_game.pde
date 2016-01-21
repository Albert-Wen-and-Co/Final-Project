class Question{
 float wid;
 float hei;
 
 Question(){
   
   wid = 1000;
   hei = 300;
 }
   
   void display(){
    rect(100,100,wid,hei); 
   }
}

class Answer{
  
  float wid;
  float hei;
  float x;
  float y;

  
  Answer(){
    width = 200;
    hei = 200;
   
  }
  
  void display(){
    rect(wid,hei,x,y);
  }
  
}