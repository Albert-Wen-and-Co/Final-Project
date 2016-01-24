class Answer{
  PVector loc;
  float wid;
  
  Answer(float x, float y){
    loc = new PVector(x,y);
    wid = 200;
  }
  
  void display(){
    fill(255);
    rect(loc.x,loc.y,200,200);
  }
  
  boolean touch(PVector mouse){
    if(loc.dist(mouse) <= wid/2){
      return true;
    } else { return false;
    }
  }
}

}
