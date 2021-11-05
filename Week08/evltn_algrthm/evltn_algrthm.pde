PFont font;
PShape s;

Population population;
Button button;

void setup() {
  size(1000, 720);
  colorMode(RGB, 1.0);
  font = createFont("Helvetica", 24);
  s = loadShape("star.svg"); 
  s.disableStyle();
  int popmax = 8;
  float mutationRate = 0.05;  
  color cmouse;
  // A pretty high mutation rate here, our population is rather small we need to enforce variety
  // Create a population with a target phrase, mutation rate, and population max
  population = new Population(mutationRate, popmax);
  // A simple button class
  button = new Button(width/2-120, height/2, 240, 40, "New Color Pattern");
}

void draw() {
  background(1.0);
  // Display the pallettes
  population.display();
  population.rollover(mouseX, mouseY);
  fill(0.5, 0.5);
  ellipse(mouseX, mouseY, 30, 30);
  // Display some text
  textAlign(CENTER);
  fill(0);
  textFont(font);
  text("Generation #: " + population.getGenerations(), width/2, height/2-30);

  // Display the button
  button.display();
  button.rollover(mouseX, mouseY);
  //saveFrame("output/####.png");
}

// If the button is clicked, evolve next generation
void mousePressed() {
  if (button.clicked(mouseX, mouseY)) {  
    population.selection();
    population.reproduction();
  }
}

void mouseReleased() {
  button.released();
}
