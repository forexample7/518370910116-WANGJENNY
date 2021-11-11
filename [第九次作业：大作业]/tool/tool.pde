import com.hamoid.*;

VideoExport videoExport;
Particle particle;
PFont f;
PGraphics pg;
String letter = "G";
String type;
boolean countmode = false;
int lettermode = 0;
int savecount = 0;

void setup(){
  size(800, 800, P3D);
  //pg = createGraphics(200, 200);
  f = createFont("Futura", 24);
  frameRate(8);
  videoExport = new VideoExport(this, "hello.mp4");
}

void draw(){
  particle = new Particle(letter);
  background(255);
  particle.run();
  if(countmode){
      particle.letterChange();
  }
  else{
    image(particle.pg, 0, 0);
  }
  lettermode = lettermode%3;
  videoExport.saveFrame();
  //image(particle.pg, 0, 0);  
}

void mouseClicked(){
  if (countmode) countmode = false;
  else countmode = true;
}

void keyPressed(){
  if (key == '\n'){
    letter = "";
  }
  else if (key == ' ') {
    save("display" + savecount + ".png");
    savecount++;
  }
  else if (key == TAB){
    lettermode++;
  }
  else if (key == '['){
    videoExport.startMovie();
  }
  else if (key == ']'){
    videoExport.endMovie();
    exit();
  }
  else{
    letter = str(key);
    letter = letter.toUpperCase();
  }
}
