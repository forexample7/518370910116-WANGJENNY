 class water{
  float dd;
  PVector position1;
  PVector position2;
  color bC;
  PVector speed;
  
  water(PVector p1, PVector p2, float d, color c){
    position1 = p1;
    position2 = p2;
    dd = d;
    bC = c;
    speed = PVector.sub(p1, p2);
  }
  
  void wbrush(){
    strokeWeight((abs(speed.x) + abs(speed.y))*dd/10);
    line(position1.x, position1.y, position2.x, position2.y);
    stroke(bC);
    //pop();
  }
}
