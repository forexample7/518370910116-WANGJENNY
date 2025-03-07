// A class to describe a population of Design
// this hasn't changed very much from example to example

class Population {

  float mutationRate;           // Mutation rate
  Design[] population;          // array to hold the current population
  ArrayList<Design> matingPool; // ArrayList which we will use for our "mating pool"
  int generations;              // Number of generations

  // Create the population
  Population(float m, int num) {
    mutationRate = m;
    population = new Design[num];//popmax = 8
    matingPool = new ArrayList<Design>();
    generations = 0;
    for (int i = 0; i < population.length; i++) {
      float angle = TWO_PI/population.length;
      //population[i] = new Design(new DNA(), 70+(i%(population.length/2))*220, 100 + ceil(i/(population.length/2))*240);
      population[i] = new Design(new DNA(), width/2+cos(angle*i)*250-s.width/2, height/2+sin(angle*i)*250-s.height/2);
    }
    //draw the position of each logos
  }

  // Display all Designs
  void display() {
    for (int i = 0; i < population.length; i++) {
      population[i].display();
    }
  }

  // Are we rolling over any of the Designs?
  void rollover(int mx, int my) {
    for (int i = 0; i < population.length; i++) {
      population[i].rollover(mx, my);
    }
  }

  // Generate a mating pool
  void selection() {
    // Clear the ArrayList
    matingPool.clear();

    // Calculate total fitness of whole population
    float maxFitness = getMaxFitness();

    // Calculate fitness for each member of the population (scaled to value between 0 and 1)
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // A higher fitness = more entries to mating pool = more likely to be picked as a parent
    // A lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = map(population[i].getFitness(), 0, maxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);  // Arbitrary multiplier
      for (int j = 0; j < n; j++) {
        matingPool.add(population[i]);
      }
    }
  }  

  // Making the next generation
  void reproduction() {
    // Refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      // Sping the wheel of fortune to pick two parents
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));
      // Pick two parents
      Design mom = matingPool.get(m);
      Design dad = matingPool.get(d);
      // Get their genes
      DNA momgenes = mom.getDNA();
      DNA dadgenes = dad.getDNA();
      // Mate their genes
      DNA child = momgenes.crossover(dadgenes);
      // Mutate their genes
      child.mutate(mutationRate);
      // Fill the new population with the new child
      //population[i] = new Design(child, 70+(i%(population.length/2))*220, 100 + ceil(i/(population.length/2))*240);
      float angle = TWO_PI/population.length;
      population[i] = new Design(child, width/2+cos(angle*i)*250-s.width/2, height/2+sin(angle*i)*250-s.height/2);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  // Find highest fintess for the population
  float getMaxFitness() {
    float record = 0;
    for (int i = 0; i < population.length; i++) {
      if (population[i].getFitness() > record) {
        record = population[i].getFitness();
      }
    }
    return record;
  }
}
