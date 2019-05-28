// oscP5 library
import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

Pointer c;
int cellSize = 20;
int state;

// Panel examples
NoiseLine line;
Ball gate1, gate2;
Distance distance;

void setup() {
  // choisir des multiples de cellSize pour la résolution
  size(1900, 1080);
  // 95 cellules de large
  // 54 cellules de hauteur

  c = new Pointer();
  state = 4; // starting scene
  
  // Module(title, x position, y position, width, height)
  line = new NoiseLine("noise1", 1, 2, 40, 30);
  gate1 = new Ball("gate1", 1, 24, 10, 10);
  gate2 = new Ball("gate2", 12, 14, 20, 10);
  gate2.radius = 15; // radius of the Ball is public
  distance = new Distance("drones", 5, 5, 60, 40);


  // OSC setup
  osc = new OscP5(this, 4444); // receive on port 4444
  remote = new NetAddress("127.0.0.1", 7777); // send on port 7777
}

void draw() {
  background(0);
  grid();
  states(state);
  c.display();
}

// useful
void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popMatrix();
  popStyle();
}
