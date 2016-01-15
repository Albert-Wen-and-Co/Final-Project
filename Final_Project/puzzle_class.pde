class Block{
  PVector loc;
  float wid,hei;
  
  Block(float x, float y){
    loc = new PVector(x,y);
    wid = 200;
    hei = 100;
  }
  
  void display(){
   fill(139,69,19);
   rect(loc.x,loc.y,wid,hei);
  }
  
  void move(){
  }
    
}