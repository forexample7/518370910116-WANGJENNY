class Particle {
  PGraphics pg;
  PImage img;
  String letter;
  boolean rolloverOn;
  color txtcolor = 0;
  //int lettermode = 0;
  Dot dots;

  Particle(String letter_) {
    pg = createGraphics(800, 800);
    letter = letter_;
  }

  void run() {
    drawLetter();
  }

  void drawLetter() {
    pg.beginDraw();
    pg.background(255);
    pg.textFont(f);
    pg.fill(txtcolor);   
    pg.textAlign(CENTER, CENTER);
    pg.textSize(800/(letter.length()+1));
    pg.text(letter, width/2, height/2-100);
    pg.endDraw();
  }

  void letterChange() {
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
