 class spray{
  float dd;
  PVector position;
  color bC;
  
  spray(PVector p, float d, color c){
    position = p;
    dd = d;
    bC = c;
  }
  
  void sbrush(){
    //push();
    //fill(bC);
    noStroke();
    int num = int(dd);
    for (int i = 0; i < num; i++){
      fill(bC, i);
      ellipse(position.x + random(dd), position.y + random(dd), dd-i, dd-i);
    }
    //pop();
  }
}
