class pointer{
  float dd;
  PVector position1;
  PVector position2;
  color bC;
  
  pointer(PVector p1, float d, color c){
    position1 = p1;
    dd = d;
    bC = c;
  }
  
  void pbrush(){
    fill(bC);
    noStroke();
    int num = int(dd);
    for (int i = 0; i < num; i++){
      ellipse(position1.x, position1.y, dd, dd);
    }
  }
}
