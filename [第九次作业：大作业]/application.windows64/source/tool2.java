import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import com.hamoid.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class tool2 extends PApplet {



VideoExport videoExport;
Particle particle;
PFont f;
PGraphics pg;
String letter = "G";
String type;
boolean countmode = false;
int lettermode = 0;
int savecount = 0;

public void setup(){
  
  //pg = createGraphics(200, 200);
  f = createFont("Futura", 24);
  frameRate(8);
  videoExport = new VideoExport(this, "hello.mp4");
  videoExport.setFrameRate(8);
}

public void draw(){
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

public void mouseClicked(){
  if (countmode) countmode = false;
  else countmode = true;
}

public void keyPressed(){
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
    type = str(key);
    type = type.toUpperCase();
    letter += type;
  }
}
class Dot{
  PImage img;
  PVector[] position = new PVector[640000];
  float linelength = width/40;
  int count = 0;
  
  Dot(PImage img_){
    img = img_;
  }
  
  public PVector[] getPixelColor(){ 
    //fill(255);
    //rect(0, 0, width, height);
    for (int i = 0; i < width; i++){
      for (int j = 0; j < height; j++){
        int c = img.get(i, j);
        if (brightness(c) == 0){
          PVector newdot = new PVector(i, j);  
          position[count] = newdot;
          count++;
        }
      }
    }
    return position;
  }
  
  public void changeLetter1(PVector[] position){
    fill(0);
    rect(0, 0, width, height);
    int num = count/100;
    strokeWeight(1);
    stroke(200, 100);
    for (int i = 0; i < num; i++){
      int dt = PApplet.parseInt(random(count));
      for (int angle = 0; angle < 360; angle = angle + 45){
        float linel = random(linelength);
        line(position[dt].x-linel*cos(angle), position[dt].y-linel*sin(angle), 
        position[dt].x+linel*cos(angle), position[dt].y+linel*sin(angle));
      }
    }
  }
  
  public void changeLetter2(PVector[] position){
    int cdt;
    fill(0);
    rect(0, 0, width, height);
    int num = count/80;
    num = PApplet.parseInt(map(mouseX, width, 0, 0, num));
    for (int i = 0; i < num; i++){
      //int dt = (int)map(i, 0, num, 0, count);
      int dt = PApplet.parseInt(random(count));
      int remainder = i%4;
      float sidel = map(mouseX, 0, width, 0, 40);
      if (remainder == 0) cdt = 0xff34A853;
      else if(remainder == 1) cdt = 0xff4285F5;
      else if(remainder == 2) cdt = 0xffFBBC05;
      else cdt = 0xffEA4335;
      push();
      noStroke();
      fill(cdt);
      rectMode(CENTER);
      rect(position[dt].x, position[dt].y, sidel, sidel);
      pop();
    }
  }
  
  public void changeLetter3(PVector[] position){
    fill(0);
    rect(0, 0, width, height);
    int num = count/400;
    num = PApplet.parseInt(map(mouseX, 0, width, 0, num));
    //strokeWeight(1);
    //stroke(255, 100);
    //float linel = random(linelength);
    
    for (int i = 0; i < num; i++){
      int dt = PApplet.parseInt(random(count));
      int angle1 = PApplet.parseInt(random(9))*45;
      int angle2 = PApplet.parseInt(random(9))*45;
      float h = random(height);
      
      beginShape();
      strokeWeight(0.5f);
      stroke(255, 200);
      bezier(0, h, width/4, h, 
      position[dt].x-width/4, position[dt].y, position[dt].x, position[dt].y);

      bezier(position[dt].x, position[dt].y, position[dt].x+width/4, position[dt].y, 
      width-width/4, h, width, h);
      endShape();
    }
    for (int i = 0; i < num*2; i++){
      int dtelps = PApplet.parseInt(random(count));
      push();
      //fill(0, map(i, 0, num, 0, 120));
      //ellipse(width/2, height/2-10, 400, 400);
      fill(0xffFFFFCD, 200);
      noStroke();
      ellipseMode(CENTER);
      ellipse(position[dtelps].x, position[dtelps].y, 20, 20);
      pop();
    }
  }
}
class Particle {
  PGraphics pg;
  PImage img;
  String letter;
  boolean rolloverOn;
  int txtcolor = 0;
  //int lettermode = 0;
  Dot dots;

  Particle(String letter_) {
    pg = createGraphics(800, 800);
    letter = letter_;
  }

  public void run() {
    drawLetter();
  }

  public void drawLetter() {
    pg.beginDraw();
    pg.background(255);
    pg.textFont(f);
    pg.fill(txtcolor);   
    pg.textAlign(CENTER, CENTER);
    pg.textSize(800/(letter.length()+1));
    pg.text(letter, width/2, height/2-100);
    pg.endDraw();
  }

  public void letterChange() {
    PImage img = pg.get();
    fill(255);
    rect(0, 0, width, height);
    dots = new Dot(img);
    PVector[] position = dots.getPixelColor();
    //lettermode = lettermode%2;
    if (lettermode == 0){
      dots.changeLetter1(position);
    }
    else if (lettermode == 1){
      dots.changeLetter2(position);
    }
    else{
      dots.changeLetter3(position);
    }
  }  
}
  public void settings() {  size(800, 800, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "tool2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
