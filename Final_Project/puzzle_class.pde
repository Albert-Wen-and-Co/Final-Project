class Block{
  PVector loc, wid,hei;
  
  Block(float x, float y){
    loc = new PVector(x,y);
  }
  
  void display(){
   fill(139,69,19);
   rect(loc.x,loc.y,wid,hei);
  }
  
  void move(){
  }
    
}