import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

NoiseLine n;
Ball b1, b2;

void setup() {
  size(600, 600);

  osc = new OscP5(this, 4444); // receive on port 4444
  remote = new NetAddress("127.0.0.1", 7777); // send on port 7777

  n = new NoiseLine("noise1", 300, 50, 200, 100);
  b1 = new Ball ("gate1", 20, 300, 200, 200);
  b2 = new Ball("gate2", 300, 300, 150, 80);
  b2.radius = 5;
}

void draw() {
  background(0);
  n.run();
  b1.run();
  b2.run();
}

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popMatrix();
  popStyle();
}
