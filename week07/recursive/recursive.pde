import com.hamoid.*;
VideoExport videoExport;
int count = 0;
color c = color(10, 40, 255);

void setup(){
  size(800, 800);
  stroke(0);
  videoExport = new VideoExport(this, "hello.mp4");
}

void draw(){
  background(0);
  translate(width/2, height/2);
  PVector branch = new PVector(mouseX, mouseY);
  float radius = map(branch.y, 0, width, 0, width);
  fill(c, 30);
  petal(0, 0, radius, branch);
  videoExport.saveFrame();
  count ++;
}

void petal(float x, float y, float radius, PVector branch){
  stroke(255);
  strokeWeight(1);
  float num = map(branch.x, 0, height, 2, 12) + 1;
  polygon(x, y, radius, int(num));
  float angle = TWO_PI/int(num);
  for (float a = 0; a < TWO_PI; a += angle){
    x = cos(a)*radius;
    y = sin(a)*radius;
    polygon(x, y, radius/2, int(num));
  }
  if(radius>2){
    petal(x, y, radius/2, branch);
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
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
