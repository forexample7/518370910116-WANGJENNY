//week2 hw1
//application of drawing

void setup(){
  size(600, 600, P3D);
  float position = mouseX;
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(0);
  
  directionalLight(300, 50, 50, 0, -10, 0);
  directionalLight(300, 75, 75, 0, 10, 0);
  pointLight(60, 20, 100, mouseX, mouseY, 300);
  
  translate(width/2, height/2);
  rotateX(radians(frameCount * 0.5));
  rotateY(radians(frameCount * 0.5));
  
  
  stroke(0, 0, 100);
  strokeWeight(2);
  
  sphere(200);
  
}
