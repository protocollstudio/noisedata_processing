// oscP5 library
import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

PFont font;

Pointer c;
int cellSize = 20;
int state;

// Panel examples
NoiseLine line;
Ball gate1, gate2;
Distance distance;

void setup() {
  // choisir des multiples de cellSize pour la résolution
  //size(1920, 1080);
  fullScreen();
  // 95 cellules de large
  // 54 cellules de hauteur
  font = createFont("font.ttf", 12);
  textFont(font);
  c = new Pointer();
  state = 4; // starting scene
  
  // Module(title, x position, y position, width, height)
  line = new NoiseLine("noise1", 80, 4, 20, 15);
  gate1 = new Ball("gate1", 80, 22, 14, 14);
  gate2 = new Ball("gate2", 80, 39, 25, 15);
  gate2.radius = 15; // radius of the Ball is public
  distance = new Distance("drones", 2, 4, 50, 30);


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
