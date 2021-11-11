class Dot{
  PImage img;
  PVector[] position = new PVector[640000];
  float linelength = width/40;
  int count = 0;
  
  Dot(PImage img_){
    img = img_;
  }
  
  PVector[] getPixelColor(){ 
    //fill(255);
    //rect(0, 0, width, height);
    for (int i = 0; i < width; i++){
      for (int j = 0; j < height; j++){
        color c = img.get(i, j);
        if (brightness(c) == 0){
          PVector newdot = new PVector(i, j);  
          position[count] = newdot;
          count++;
          //for (int angle = 0; angle < 360; angle = angle + 45){
          //  float linel = random(linelength);
          //  line(newdot.x-linel*cos(angle), newdot.y-linel*sin(angle), newdot.x+linel*cos(angle), newdot.y+linel*sin(angle));
          //}
        }
      }
    }
    return position;
  }
  
  void changeLetter1(PVector[] position){
    fill(0);
    rect(0, 0, width, height);
    int num = count/100;
    strokeWeight(1);
    stroke(200, 100);
    for (int i = 0; i < num; i++){
      int dt = int(random(count));
      for (int angle = 0; angle < 360; angle = angle + 45){
        float linel = random(linelength);
        line(position[dt].x-linel*cos(angle), position[dt].y-linel*sin(angle), 
        position[dt].x+linel*cos(angle), position[dt].y+linel*sin(angle));
      }
    }
  }
  
  void changeLetter2(PVector[] position){
    fill(0);
    rect(0, 0, width, height);
  }
}
