// oscP5 library
import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

PFont font; // main font

Pointer c;
int cellSize = 10; // size for main scaling
int state = 5; // starting scene (1 to 5)

// Panel examples
Line line1;
Ball gate1, gate2;
Distance distance, distance2;

void setup() {
  // choisir des multiples de cellSize pour la résolution
  size(1200, 700);
  //fullScreen();
  // 95 cellules de large
  // 54 cellules de hauteur
  
  textFont(createFont("font.ttf", 20));
  c = new Pointer();
  
  // Module(title, x position, y position, width, height)
  line1 = new Line("noise1", 2, 4, 30, 20);
  gate1 = new Ball("gate1", 2, 26, 30, 20);
  gate2 = new Ball("gate2", 2, 48, 30, 20);
  gate2.radius = 30; // radius of the Ball is public
  distance = new Distance("drones", 35, 4, 60, 60);
  distance2 = new Distance("drones2", 100, 4, 60, 60);

  // OSC setup
  osc = new OscP5(this, 4444); // receive on port 4444
  remote = new NetAddress("127.0.0.1", 7777); // send on port 7777
}

void draw() {
  background(0);
  // grid(); // too greedy
  states(state);
  c.display();
}
