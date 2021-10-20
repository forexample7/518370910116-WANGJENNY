void setup(){
  size(600, 600);
  background(255);
  frameRate(5);
  initiateData();
}

float w = 600;
float h = 600;
float x0 = 0; 
float y0 = 0;
float[] arr;

void draw(){
  fill(255, 20);
  rect(0, 0, width, height);
  drawLines(w, h, x0, y0);


}

void initiateData(){
  fill(255);
  rect(0, 0, width, height);
}

void drawLines(float w, float h, float x0, float y0){
  float x1, y1;
  translate(x0, y0);
  stroke(0);
  strokeWeight(6);
  x1 = random(w);
  y1 = random(h);
  line(0, y1, w, y1);
  line(x1, 0, x1, w);
  float k = random(0, 1);
  float rangeRectX = w - x1;
  float rangeRectY = h - y1;
  fill(0);
  
  if(k<=0.25){rect(x1, y1, random(rangeRectX), random(rangeRectY));}
  else if(k>0.25&&k<=0.5){rect(x1, y1, -random(rangeRectX), random(rangeRectY));}
  else if(k>0.5&&k<=0.75){rect(x1, y1, random(rangeRectX), -random(rangeRectY));}
  else {rect(x1, y1, -random(rangeRectX), -random(rangeRectY));}

  //float[] arr ={x1, w, y1, h};
  //return arr;
}

void keyPressed(){
  if (key == ' '){
    initiateData();
  }
}

  
  
