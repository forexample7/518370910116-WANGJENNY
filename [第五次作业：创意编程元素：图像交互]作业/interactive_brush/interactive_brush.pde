String colorName, brushMode;
int brushCount = 0;
int strokeCount = 1;//medium
int colorCount = 0;
color b;
pointer Pointer;
spray Spray;
water Water;

void setup(){
  size(800, 600);
  frameRate(5000);
  colorMode(HSB);
  smooth();
  initiate();
}

void initiate(){
  background(255);
}

//pointer, watercolor, spray, 
//white, yellow, red, blue, green
//stroke: light medium heavy
void draw(){

  PVector p1 = new PVector(mouseX, mouseY);
  PVector p2 = new PVector(pmouseX, pmouseY);
  int brush = brushCount%3;
  int colorc = colorCount%4;
  //color b = color(H, 200, 255);
  color b = color(map(mouseX + mouseY, 0, width + height, 64*colorc-1, 64*(colorc+1)-1), 155, 255);
  
  float dd = decideStroke(strokeCount);
  
  //boolean press = click();
  
  if(mousePressed){
    switch(brush){
      case(0):
        Spray = new spray(p1, dd, b);
        Spray.sbrush();
        break;
      case(1):
        Pointer = new pointer(p1, dd, b);
        Pointer.pbrush();
        break;
      
      case(2):
        Water = new water(p1, p2, 10, b);
        Water.wbrush();
        break;
        
    }
  }
}

float decideStroke(int strokeCount){
  float dd = 0;
  switch(strokeCount){
    case(0):
      dd = 10;
      break;
    case(1):
      dd = 20;
      break;
    case(2):
      dd = 30;
      break;
  }
  return dd;
}

void keyPressed(){
 if (key == ' '){
   initiate();
 }
 if (key == TAB){
   brushCount ++;
 }
 if (key == '[' && strokeCount > 0){
   strokeCount --;
 }
 if (key == ']' && strokeCount < 2){
   strokeCount ++;
 }
 if (key == 'c'){
   colorCount ++;
 }
 if (key == 's'){
   save("canvas-####");
 }
}
