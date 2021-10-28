//import processing.pdf.*;

Elmnt[] particles = new Elmnt[6000];
PVector l;
float alpha;

void setup(){
  size(800, 800);
  background(0);
  frameRate(30);
  //beginRecord(PDF, "frame-####.pdf");
  initiate();
}

void initiate(){
  for (int i = 0; i < particles.length; i++){
    PVector l = new PVector(random(width), random(height));
    PVector m = new PVector(mouseX, mouseY);
    float r = map(l.y, 0, height, 255, 0);
    float g = map(PVector.dist(m, l), 0, 800, 0, 255);
    color cInput = color(r, g, 255);
    particles[i] = new Elmnt(l, cInput);
  }
}

void draw(){
  fill(0, 10);
  rect(0, 0, width, height);
  for (int i = 0; i < particles.length; i++){
    particles[i].run();
  }
  saveFrame("line-######.png");
}

void mousePressed(){
  initiate();
}

void keyPressed(){
  if (key == 's'){
    //beginRecord(PDF, "frame-####.pdf");
    //saveFrame("line-######.png");
  }
  if (key == 'q'){
    //endRecord();
    exit();
  }
}
