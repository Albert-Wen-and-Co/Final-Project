Class rect{
  PVector loc;
  float wid,hei;
  String answer;
  
  
  Rect(float x, float y); {
    loc = new PVector(x,y);
    wid = 100;
    hei = 100;
    
    
  }
  
  void display(){
    fill(0,255,0);
    rect(loc.x,loc.y,wid,hei);
    
  }
  
  void mouseClicked(){
    return true;
  } else { return false;}
    
  }
}