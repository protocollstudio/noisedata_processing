// Module(title, x position, y position, width, height)

void states(int state) {
  switch (state) { 
  case 1 : 
    line = new NoiseLine("noise1", 1, 2, 40, 30);
    line.run();
    break;
  case 2 : 
    gate1 = new Ball("gate1", 1, 24, 10, 10);
    gate1.run();
    break;
  case 3 :
    gate2 = new Ball("gate2", 12, 14, 20, 10);
    gate2.radius = 15; // radius of the Ball is public
    gate2.run();
    break;
  case 4 : 
    distance = new Distance("drones", 5, 5, 60, 40);
    distance.run();
    break;
  }
}
