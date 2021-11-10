class Particle {
  PGraphics pg;
  PImage img;
  String letter;
  boolean rolloverOn;
  color txtcolor = 0;
  Dot dots;

  Particle(String letter_) {
    pg = createGraphics(800, 800);
    letter = letter_;
  }

  void run() {
    drawLetter();
    //if(mousePressed == true){
    //  letterChange();
    //}
    //else{
    //  image(img, 0, 0);
    //}
  }

  void drawLetter() {
    pg.beginDraw();
    pg.background(255);
    pg.textFont(f);
    pg.fill(txtcolor);   
    pg.textAlign(CENTER, CENTER);
    pg.textSize(400);
    pg.text(letter, width/2, height/2-100);
    pg.endDraw();
  }

  void letterChange() {
    PImage img = pg.get();
    fill(255);
    rect(0, 0, width, height);
    dots = new Dot(img);
    dots.changeLetter1(dots.getPixelColor());
  }
}
