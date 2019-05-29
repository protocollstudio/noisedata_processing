
// oscP5 library
import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

// Global
int fg = 255;
int bg = 0;
PFont font;

Pointer c;
int cellSize = 10;
int state;

// Panel examples
Line line1;
Line line2;
Ball gate1, gate2;
Ball gate3, gate4;
Distance distance;
Pot sequence1;

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
  line1 = new Line("noise1", 83, 4, 20, 15);
  line2 = new Line("noise2", 20, 20, 40, 30);
  line2.step = 0.1;
  gate1 = new Ball("gate1", 83, 22, 16, 16);
  gate2 = new Ball("gate2", 83, 41, 30, 20);
  gate2.radius = 15; // radius of the Ball is public
  gate3 = new Ball("gate3", 10, 10, 50, 60);
  gate3.vel = new PVector(12, 15);
  gate3.radius = 20;
  gate4 = new Ball("gate4", 62, 40, 40, 30);
  distance = new Distance("drones", 2, 4, 80, 60);
  sequence1 = new Pot("sequence1", 83, 50, 40, 20);


  // OSC setup
  osc = new OscP5(this, 4444); // receive on port 4444
  remote = new NetAddress("127.0.0.1", 7777); // send on port 7777
}

void draw() {
  background(0);
  
  states(state);
  //c.display();
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
