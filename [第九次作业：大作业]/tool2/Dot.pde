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
    color cdt;
    fill(0);
    rect(0, 0, width, height);
    int num = count/80;
    num = int(map(mouseX, width, 0, 0, num));
    for (int i = 0; i < num; i++){
      //int dt = (int)map(i, 0, num, 0, count);
      int dt = int(random(count));
      int remainder = i%4;
      float sidel = map(mouseX, 0, width, 0, 40);
      if (remainder == 0) cdt = #34A853;
      else if(remainder == 1) cdt = #4285F5;
      else if(remainder == 2) cdt = #FBBC05;
      else cdt = #EA4335;
      push();
      noStroke();
      fill(cdt);
      rectMode(CENTER);
      rect(position[dt].x, position[dt].y, sidel, sidel);
      pop();
    }
  }
  
  void changeLetter3(PVector[] position){
    fill(0);
    rect(0, 0, width, height);
    int num = count/400;
    num = int(map(mouseX, 0, width, 0, num));
    //strokeWeight(1);
    //stroke(255, 100);
    //float linel = random(linelength);
    
    for (int i = 0; i < num; i++){
      int dt = int(random(count));
      int angle1 = int(random(9))*45;
      int angle2 = int(random(9))*45;
      float h = random(height);
      
      beginShape();
      strokeWeight(0.5);
      stroke(255, 200);
      bezier(0, h, width/4, h, 
      position[dt].x-width/4, position[dt].y, position[dt].x, position[dt].y);

      bezier(position[dt].x, position[dt].y, position[dt].x+width/4, position[dt].y, 
      width-width/4, h, width, h);
      endShape();
    }
    for (int i = 0; i < num*2; i++){
      int dtelps = int(random(count));
      push();
      //fill(0, map(i, 0, num, 0, 120));
      //ellipse(width/2, height/2-10, 400, 400);
      fill(#FFFFCD, 200);
      noStroke();
      ellipseMode(CENTER);
      ellipse(position[dtelps].x, position[dtelps].y, 20, 20);
      pop();
    }
  }
}
