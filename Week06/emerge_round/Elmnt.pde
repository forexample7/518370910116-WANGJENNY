class Elmnt{
  PVector location;
  PVector speed;
  float increment, beta;
  color c;
  float attractionIndex = 10;
  float d;

  Elmnt(PVector l, color cInput, float dd){
    location = l;
    c = cInput;
    d = dd;
    speed = new PVector(random(-1, 1), random(-1, 1));
  }
  
  public void run(){
    move();
    wrap();
    display();
  }
  
  void move(){
    float x = map(location.x, -d, d, 0.05, 0.3);
    float y = map(location.y, -d, d, 0.05, 0.3);
    PVector change = new PVector(x, y);
    beta = map(noise(x, y), -1, 1, 0, PI);
    change.x += (cos(beta))*2;
    change.y += (sin(beta))*2;
    println(beta);
    change.x *= speed.x;
    change.y *= speed.y;
    //float rx = random(-2, 2);
    //float ry = random(-2, 2);
    //noise returns orderly numbers between 0 and 1
    location.add(change);
  }

  void display(){
    noStroke();
    fill(c);

      ellipse(location.x, location.y, 1, 1);

  }
  
  void wrap() {
    float distance = location.mag();
    if (distance > d){
      location.x = 0;
      location.y = 0;
    }
  }
  
}
