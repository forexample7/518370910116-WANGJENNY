PFont f;
PGraphics pg;
String letter = "G";
Particle particle;

void setup(){
  size(800, 800, P3D);
  //pg = createGraphics(200, 200);
  f = createFont("Futura", 24);
}

void draw(){
  particle = new Particle(letter);
  background(255);
  particle.run();
  if(mousePressed == true){
      particle.letterChange();
  }
  else{
    image(particle.pg, 0, 0);
  }
  //image(particle.pg, 0, 0);  
}

void keyPressed(){
  if (key == '\n'){
    letter = "";
  }
  else{
    letter = str(key);
    letter = letter.toUpperCase();
  }
}
