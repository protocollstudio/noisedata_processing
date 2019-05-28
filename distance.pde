// Module : circular multi points at equal distances 
class Distance extends Panel {

  private OscMessage[] messages;
  // add global variables of your sketch here 
  int fg, bg; // foreground and background colors
  int nbNodes;
  Node[] nodes;
  float radius, angle; // variables for creating nodes
  private float longest; // maximum length between a node and cursor ot make it equal to zero
  String mode;
  float cursorX, cursorY; // position of the cursor
  float inc, step, speed; // noise mode variables
  // lissajous mode variable
  float freqA, freqB, signalA, signalB, phaseA, phaseB;


  Distance(String title, float aX, float aY, float aW, float aH) {
    super(title, aX, aY, aW, aH);
    // insert your sketch setup here 
    fg = 255;
    bg = 0;
    nbNodes = 6;
    // initialize noise mode variables
    inc = 0;
    step = 0.10;
    speed = 1;
    // initialize lissajous mode variables
    freqA = 1.2;
    freqB = 1.5;
    phaseA = 0;
    phaseB = 0;
    // default mode
    mode = "mouse";
    createNodes();
  }

  void run() {
    push();
    display();
    render();
    pop();
    send();
  }

  private void render() {

    // insert your sketch draw function here
    ellipseMode(CENTER);
    modes(); // select between mouse/noise/lissajous modes
    for (int i = 0; i < nbNodes; i++) {
      stroke(fg);
      line(nodes[i].x, nodes[i].y, cursorX, cursorY); //display lines
      nodes[i].display(); // display nodes
      // display bars and percentages
      noStroke();
      fill(fg);
      float barSize = radius / 10;
      rect(barSize, i * barSize/2 + barSize, map(nodes[i].value, 0, longest, 0, 100), barSize/3);
      textSize(barSize/2);
      float gui_value = (round(map(nodes[i].value, 0, longest, 0, 1000))) / 10;
      text(gui_value + "%", 100 + barSize, i * barSize/2 + barSize + barSize/3);
    }
    // display cursor
    stroke(fg);
    fill(bg);
    ellipse(cursorX, cursorY, radius/10, radius/10); // size proportional to radius
    // noise factor
    inc += step;
    instructions();
  }

  private void send() {
    for (int i = 0; i < nbNodes; i++) {
      // each node send an osc message on a different address based on node number
      messages[i] = new OscMessage("/node" + i);
      /* each message is a float between 0 and 1 proportional to the distance
       between the node and the cursor */
      messages[i].add(norm(nodes[i].value, 0, longest));
      osc.send(messages[i], remote);
    }
  }

  void createNodes() {
    nodes = new Node[nbNodes];
    angle = -PI / 2; // first node on top at 12 o'clock
    // calculate the maximum size of the nodes circle according to the resolution of the panel
    if (panelW > panelH) {
      radius = (panelH - panelH / 5) / 2;
    } else {
      radius = (panelW - panelW / 5) / 2;
    }
    // dispatch the nodes on a circle
    for (int i = 0; i < nbNodes; i++) {
      float posX = cos(angle) * radius;
      float posY = sin(angle) * radius;
      nodes[i] = new Node(i, posX + panelW / 2, posY + panelH / 2);
      angle += TWO_PI / nbNodes;
    }
    // determinate the value from which a node equal to zero
    longest = radius * 2 - radius / 5;
    // resize the array of messages according to the number of nodes
    messages = new OscMessage[nbNodes];
  }

  private void modes() {
    if (mode == "mouse") {
      mouseMode();
    }
    if (mode == "noise") {
      noiseMode();
    }
    if (mode == "lissajous") {
      lissajousMode();
    }
  }

  private void mouseMode() {
    noCursor();
    cursorX = mouseX;
    cursorY = mouseY;
  }

  private void noiseMode() {
    cursor();
    if (dist(cursorX, cursorY, panelW / 2, panelH / 2) < radius) {
      cursorX += noise(inc) * speed * 2 - speed;
      cursorY += noise(inc + 100) * speed * 2 - speed;
    } else {
      if (cursorX > panelW / 2) {
        cursorX -= noise(inc) * speed * 2;
      } else {
        cursorX += noise(inc) * speed * 2;
      }
      if (cursorY > panelH / 2) {
        cursorY -= noise(inc) * speed * 2;
      } else {
        cursorY += noise(inc) * speed * 2;
      }
      inc += 10;
    }
  }

  private void lissajousMode() {
    cursor();
    signalA = sin(radians(freqA * frameCount + phaseA));
    signalB = cos(radians(freqB * frameCount + phaseB));
    cursorX = signalA * radius + panelW / 2;
    cursorY = signalB * radius + panelH / 2;
  }

  void instructions() {
    textSize(10);
    fill(fg);
    if (mode == "noise") {
      text("energy = " + round(speed*10), 10, panelH - 55);
      text("chaos = " + round(step*100), 10, panelH - 40);
      text("increase/decrease energy : press i/d", 10, panelH - 25);
      text("increase/decrease chaos : press -/+", 10, panelH - 10);
    }
    if (mode == "lissajous") {
      text("phaseA = " + phaseA, 10, panelH - 100);
      text("phaseB = " + phaseB, 10, panelH - 85);
      text("freqA = " + round(freqA*100), 10, panelH - 70);
      text("freqB = " + round(freqB*100), 10, panelH - 55);
      text("increase/decrease phases : press arrows", 10, panelH - 40);
      text("increase/decrease freqA : press i/d", 10, panelH - 25);
      text("increase/decrease freqB : press -/+", 10, panelH - 10);
    }
    push();
    textAlign(RIGHT);
    text("add/remove node : press a/r", panelW - 10, panelH - 70);
    text("change theme : press c", panelW - 10, panelH - 55);
    text("lissajous mode : press l", panelW - 10, panelH - 40);
    text("noise mode : press n", panelW - 10, panelH - 25);
    text("mouse mode : press m", panelW - 10, panelH - 10);
    inc += step;
    pop();
  }

  class Node {
    float x, y, value;
    int n;

    Node(int aNumber, float aX, float aY) {
      n = aNumber;
      x = aX;
      y = aY;
    }

    void display() {
      push();
      noStroke();
      fill(fg);
      ellipse(x, y, radius/10, radius/10); // size proportional to radius
      value = constrain(longest - dist(x, y, cursorX, cursorY), 0, longest);
      float arcSize = map(value, 0, longest, 0, TWO_PI);
      fill(fg, 100);
      arc(x, y, radius/6, radius/6, PI/2, arcSize+PI/2); // size proportional to radius
      fill(bg);
      textSize(radius/20); // size proportional to radius
      textAlign(CENTER);
      text(n, x, y + radius/60); // size proportional to radius
      pop();
    }
  }
}
