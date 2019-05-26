import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress remote;

OscMessage[] messages;

int nbNodes;
Node[] nodes;
float angle, radius;
float x, y;
float longest;
int foreground, background;
float posX, posY;
float inc, step, speed;
float freqA = 0.5, freqB = 0.7;
float signalA, signalB;
float phaseA = 0, phaseB = 0;
String mode;

void setup() {
  size(800, 600);
  foreground = 50;
  background = 240;
  nbNodes = 1;
  nodes = new Node[nbNodes];
  angle = -PI/2;
  if (width > height) {
    radius = (height - height/5)/2;
  } else {
    radius = (width - width/5)/2;
  }
  for (int i = 0; i < nbNodes; i++) {
    x = cos(angle) * radius;
    y = sin(angle) * radius;
    nodes[i] = new Node(i, x + width/2, y + height/2);
    angle += TWO_PI / nbNodes;
  }
  longest = radius * 2 - radius / 5;

  // NOISE MODE
  inc = 0;
  step = 0.10;
  speed = 1;
  mode = "mouse";

  // OSC SETUP
  osc = new OscP5(this, 4444);
  remote = new NetAddress("127.0.0.1", 7777);
  messages = new OscMessage[nbNodes];
}

void draw() {
  background(background);
  ellipseMode(CENTER);

  modes();
  for (int i = 0; i < nbNodes; i++) {
    stroke(foreground);
    line(nodes[i].x, nodes[i].y, posX, posY);
    nodes[i].display();
    noStroke();
    fill(foreground);
    rect(10, i*10+10, map(nodes[i].value, 0, longest, 0, 50), 5);
    textSize(8);
    float gui_value = round(map(nodes[i].value, 0, longest, 0, 1000));
    gui_value /= 10;
    text(gui_value + "%", 63, i*10+16);

    // OSC
    messages[i] = new OscMessage("/node" + i);
    messages[i].add(norm(nodes[i].value, 0, longest));
    osc.send(messages[i], remote);
  }

  stroke(foreground);
  fill(background);
  ellipse(posX, posY, 15, 15);

  // MODES
  textSize(10);
  fill(foreground);
  if (mode == "noise") {
    text("energy = " + round(speed*10), 10, height - 55);
    text("chaos = " + round(step*100), 10, height - 40);
    text("increase/decrease energy : press i/d", 10, height - 25);
    text("increase/decrease chaos : press -/+", 10, height - 10);
  }
  if (mode == "lissajous") {
    text("phaseA = " + phaseA, 10, height - 85);
    text("phaseB = " + phaseB, 10, height - 70);
    text("freqA = " + round(freqA*100), 10, height - 55);
    text("freqB = " + round(freqB*100), 10, height - 40);
    text("increase/decrease freqA : press i/d", 10, height - 25);
    text("increase/decrease freqB : press -/+", 10, height - 10);
  }
  push();
  textAlign(RIGHT);
  text("add/remove node : press a/r", width - 10, height - 70);
  text("change theme : press c", width - 10, height - 55);
  text("lissajous mode : press l", width - 10, height - 40);
  text("noise mode : press n", width - 10, height - 25);
  text("mouse mode : press m", width - 10, height - 10);
  inc += step;
  pop();
}

class Node {
  float x, y, value;
  int n;
  Node(int number, float posX, float posY) {
    n = number;
    x = posX;
    y = posY;
  }

  void display() {
    push();
    noStroke();
    fill(foreground);
    ellipse(x, y, 25, 25);
    value = constrain(longest - dist(x, y, posX, posY), 0, longest);
    float arcSize = map(value, 0, longest, 0, TWO_PI);
    fill(foreground, 100);
    arc(x, y, 35, 35, PI/2, arcSize+PI/2);
    fill(background);
    textSize(10);
    textAlign(CENTER);
    text(n, x, y+4);
    pop();
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    nbNodes++;
    createNodes();
  }
  if (key == 'r' || key =='R') {
    nbNodes--;
    createNodes();
  }
  if (key == 'm' || key == 'M') {
    mode = "mouse";
  }
  if (key == 'n' || key == 'N') {
    mode = "noise";
  }
  if (key == 'l' || key == 'L') {
    mode = "lissajous";
  }
  if (key == '+') {
    if (mode == "noise") {
      step += 0.01;
    }
    if (mode == "lissajous") {
      freqB += 0.01;
    }
  }
  if (key == '-') {
    if (mode == "noise") {
      step -= 0.01;
    }
    if (mode == "lissajous") {
      freqB -= 0.01;
    }
  }
  if (key == 'i' || key == 'I') {
    if (mode == "noise") {
      speed += 0.1;
    }
    if (mode == "lissajous") {
      freqA += 0.01;
    }
  }
  if (key == 'd' || key == 'D') {
    if (mode == "noise") {
      speed -= 0.1;
    }
    if (mode == "lissajous") {
      freqA -= 0.01;
    }
  }
  if (mode == "lissajous") {
    if (keyCode == LEFT) {
      phaseA -= 1;
    }
    if (keyCode == RIGHT) {
      phaseA += 1;
    }
    if (keyCode == UP) {
      phaseB += 1;
    }
    if (keyCode == DOWN) {
      phaseB -= 1;
    }
  }
  if (key == 'c' || key =='C') {
    foreground = foreground == 50 ? 255 : 50;
    background = background == 240 ? 0 : 240;
  }
  freqA = freqA < 0 ? 0 : freqA;
  freqB = freqB< 0 ? 0 : freqB;
  speed = speed < 0 ? 0 : speed;
  step = step < 0.01 ? 0.01 : step;
}



void modes() {
  if (mode == "mouse") {
    noCursor();
    posX = mouseX;
    posY = mouseY;
  }
  if (mode == "noise") {
    cursor();
    if (dist(posX, posY, width/2, height/2) < radius) {
      posX += noise(inc) * speed * 2 - speed; 
      posY += noise(inc+100) * speed * 2 - speed;
    } else {
      if (posX > width/2) {
        posX -= noise(inc) * speed * 2;
      } else {
        posX += noise(inc) * speed * 2;
      }
      if (posY > height/2) {
        posY -= noise(inc) * speed * 2;
      } else {
        posY += noise(inc) * speed * 2;
      }
      inc += 10;
    }
  }
  if (mode == "lissajous") {
    cursor();
    signalA = sin(radians(freqA * frameCount + phaseA));
    signalB = cos(radians(freqB * frameCount + phaseB));
    //angle1 += speed1;
    //angle2 += speed2;
    posX = signalA * radius + width/2;
    posY = signalB * radius + height/2;
  }
}

void createNodes() {
  nodes = new Node[nbNodes];
  angle = -PI/2;
  if (width > height) {
    radius = (height - height/5)/2;
  } else {
    radius = (width - width/5)/2;
  }
  for (int i = 0; i < nbNodes; i++) {
    x = cos(angle) * radius;
    y = sin(angle) * radius;
    nodes[i] = new Node(i, x + width/2, y + height/2);
    angle += TWO_PI / nbNodes;
  }
  longest = radius * 2 - radius / 5;
  messages = new OscMessage[nbNodes];
}

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle(); 
  popMatrix();
}
