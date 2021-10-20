PFont font;
PGraphics pg;
color c;
String txt = "Lorem";


void setup(){
  size(800, 800, P2D);

  //font = loadFont("RobotoSlab-VariableFont_wght.ttf");
  font = createFont("Impact", 100);
  pg = createGraphics(800, 800, P2D);
  frameRate(200);
  colorMode(HSB);
  
}

void draw(){
  background(64);
  
  int tileX = 400;
  int tileY = 400;
  int tileW = width/tileX;
  //int tileH = width/tileY;
  
  drawCanvas();
  
  for (int i = 0; i < tileX; i++){
    
      int wave1 = int(map(sin(radians(frameCount+i*45)), -1, 1, 
      -height/8, height/8));
      int wave3 = int(sin(radians(frameCount+i))*height/12);
      //int wave2 = int(sin(i)*height/2);
      int sx = tileW*i;
      int sy = 0;
      int sw = tileW;
      int sh = height;
      int dx = tileW*i;
      int dy = wave3;
      int dw = tileW;
      int dh = height;

      push();
      fill((frameCount+i)%360, 255, 70);
      blendMode(SCREEN);
      rect(dx, dy, dw, dh);
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh); 
      pop();
  }
  
  drawEllipse(200);  
  changeColor();
}

void drawCanvas(){
  pg.beginDraw();
  pg.background(64);
  pg.stroke(0);
  pg.strokeWeight(30);
  pg.textFont(font);
  pg.push();
  pg.translate(width/2, height/2);
  pg.textAlign(CENTER, CENTER);
  pg.fill(0);
  pg.textSize(250);
  pg.text("ALOHA", 6, 6);
  pg.fill(255);
  pg.textSize(250);
  pg.text("ALOHA", 0, 0);
  pg.pop();
  pg.endDraw();
  
}


void drawEllipse(int r){
  push();

  fill(frameCount%360, 100, 255);
  blendMode(MULTIPLY);
  noStroke();
  ellipse(mouseX, mouseY, r, r);
  //filter(BLUR, 10);
  
  pop();
}

void changeColor(){
  if(mousePressed == true){
    filter(INVERT);
  }
}
