// oscP5 library
import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

Pointer c;
int cellSize = 20;
int state = 4;

// Panel examples
NoiseLine n;
Ball b1, b2;
Distance d;

void setup() {
  // choisir des multiples de cellSize pour la résolution
  size(1900, 1080);
  // 95 cellules de large
  // 54 cellules de hauteur

  c = new Pointer();

  // OSC setup
  osc = new OscP5(this, 4444); // receive on port 4444
  remote = new NetAddress("127.0.0.1", 7777); // send on port 7777

  // Module(title, x position, y position, width, height)
  d = new Distance("drones", 1, 1, 50, 40);
  n = new NoiseLine("noise1", 1, 1, 20, 10);
  b1 = new Ball("gate1", 1, 24, 10, 10);
  b2 = new Ball("gate2", 12, 14, 20, 10);
  b2.radius = 15; // radius of the Ball is public
}

void draw() {
  background(0);
  grid();
  states(state);
  c.display();
}

void grid() {
  int rows = height / cellSize;
  int cols = width / cellSize;
  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      stroke(50);
      point(i * cellSize, j * cellSize);
    }
  }
}

class Pointer {
  int x, y;

  Pointer() {
    x = 0;
    y = 0;
  }
  void display() {
    noStroke();
    fill(255, 100);
    rect(x, y, cellSize, cellSize); // remplacer par cellSize ?
  }
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
