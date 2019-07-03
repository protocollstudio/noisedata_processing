
// oscP5 library
import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

// Global
// Appearance
int fg = 255; // foreground color
int bg = 0; // background color
PFont font;

Pointer c;
int cellSize = 10; // size of grid cells
int scene;

// Panel examples
Line line0, line1, line2, line3;
Ball gate0, gate1, gate2, gate3;
Distance distance;
Pot sequence;

void setup() {
  // choisir des multiples de cellSize pour la résolution
  // size(1080, 720);
  fullScreen();
  // 95 cellules de large
  // 54 cellules de hauteur
  font = createFont("../../font/inconsolata.ttf", 12);
  textFont(font);

  c = new Pointer();
  scene = 1; // starting scene

  // Module(title, x position, y position, width, height)
  line0 = new Line("LINE0", 2, 4, 25, 10);
  line0.step = 0.005;
  line1 = new Line("LINE1", 2, 17, 25, 10);
  line1.step = 0.01;
  line2 = new Line("LINE2", 2, 30, 25, 10);
  line2.step = 0.03;
  line3 = new Line("LINE3", 2, 43, 25, 10);
  line3.step = 0.07;
  gate0 = new Ball("GATE0", 2, 56, 15, 15);
  gate0.velocity = new PVector(0.7, 0.9);
  gate1 = new Ball("GATE1", 18, 56, 15, 15);
  gate1.velocity = new PVector(1, -1.4);
  gate2 = new Ball("GATE2", 34, 56, 15, 15);
  gate2.velocity = new PVector(-1.8, 1.5);
  gate3 = new Ball("GATE3", 50, 56, 15, 15);
  gate3.velocity = new PVector(-2, -2.5);
  distance = new Distance("NODES", 28, 4, 79, 49);
  sequence = new Pot("SEQUENCE", 66, 56, 41, 15);

  // OSC setup
  osc = new OscP5(this, 4444); // receive on port 4444
  remote = new NetAddress("127.0.0.1", 7777); // send on port 7777
}

void draw() {
  background(0);
  states(scene);
  //c.display();
}
