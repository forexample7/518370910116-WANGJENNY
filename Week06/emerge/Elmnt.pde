class Elmnt{
  PVector location;
  float increment, beta;
  color c;
  float attractionIndex = 10;

  Elmnt(PVector l, color cInput){
    location = l;
    c = cInput;
  }
  
  public void run(){
    move();
    wrap();
    mouseAttraction();
    display();
  }
  
  void move(){
    increment += 0.008;
    float x = map(location.x, 0, width, 0.05, 0.3);
    float y = map(location.y, 0, height, 0.05, 0.3);
    beta = noise(x*50, y*50, increment)*2*PI;
    float rx = random(-2, 2);
    float ry = random(-2, 2);
    //noise returns orderly numbers between 0 and 1
    location.x += cos(beta)*2 + rx;
    location.y += sin(beta)*2 + ry;
  }
  /*
  void colorHue(){
    PVector m = new PVector(mouseX, mouseY);
    float hue = map(PVector.dist(m, location), 0, 800, 0, 360);
    brightness(c) = hue;
  }
  */
  
  void display(){
    noStroke();
    fill(c);
    if (location.x > 0 && location.x < width && location.y > 0 && location.y < height){
      ellipse(location.x, location.y, 1, 1);
    }
  }
  
  void mouseAttraction(){
    PVector m = new PVector(mouseX, mouseY);
    float d = PVector.dist(m, location);
    PVector attr = PVector.sub(m, location);
    attr.normalize();
    attr.mult(attractionIndex/d);
    location.add(attr);
  }
  
  void wrap() {
    if (location.x < 0) location.x = width;
    if (location.x > width ) location.x =  0;
    if (location.y < 0 ) location.y = height;
    if (location.y > height) location.y =  0;
  }
  
}
