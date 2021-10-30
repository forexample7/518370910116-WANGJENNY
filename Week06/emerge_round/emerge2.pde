import com.hamoid.*;

VideoExport videoExport;

Elmnt[] particles = new Elmnt[6000];
PVector l;
float alpha;
float dd = 300;//radius of the circle

void setup(){
  size(800, 800);
  background(0);
  frameRate(30);
  videoExport = new VideoExport(this, "hello.mp4");
  initiate();
}

void initiate(){
  background(0);
  for (int i = 0; i < particles.length; i++){
    float a = random(2*PI);
    float dr = random(dd);
    PVector l = new PVector(cos(a)*dr, sin(a)*dr);
    PVector m = new PVector(mouseX, mouseY);
    float r = map(l.mag(), 0, dd, 255, 0);
    float g = map(PVector.dist(m, l), 0, 800, 0, 255);
    color cInput = color(r, g, 255);
    particles[i] = new Elmnt(l, cInput, dd);
  }
}

void draw(){
  
  fill(0, 10);
  rect(0, 0, width, height);
  push();
  translate(width/2, height/2);
  for (int i = 0; i < particles.length; i++){
    particles[i].run();
  }
  pop();
  videoExport.saveFrame();
}

void mousePressed(){
  initiate();
}

void keyPressed(){
  if (key == 's'){
    videoExport.startMovie();
  }
  if (key == 'q'){
    videoExport.endMovie();
    exit();
  }
}
