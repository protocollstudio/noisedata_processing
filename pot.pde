class Pot extends Panel {
  int nbRotaries;
  Rotary[] rotaries;

  String address;
  private OscMessage[] messages;
  // add global variables of your sketch here 


  Pot(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);
    // insert your sketch setup here
    nbRotaries = 5;
    rotaries = new Rotary[nbRotaries];
    for (int i = 0; i < nbRotaries; i++) {
      rotaries[i] = new Rotary(i+2);
    }
  }

  void run() {
    render();
    // send();
  }

  void render() {
    push();
    display();
    // insert your sketch draw function here
    translate(50, 0);
    for (int i = 0; i < nbRotaries; i++) {
      push();
      translate(i*60, h/2);
      rotaries[i].run();
      pop();
    }
    pop();
  }

  void send() {
    for (int i = 0; i < nbRotaries; i++) {
      // each node send an osc message on a different address based on node number
      messages[i] = new OscMessage("/pot" + i);
      /* each message is a float between 0 and 1 proportional to the distance
       between the node and the cursor */
      messages[i].add(rotaries[i].bang);
      osc.send(messages[i], remote);
    }
  }

  class Rotary {
    private float angle;
    private float speed;
    int bang;


    Rotary(float aSpeed) {
      speed = aSpeed;
      angle = 0;
      bang = 0;
    }

    void run() {
      update();
      display();
    }

    void update() {
      angle += speed;
    }

    void display() {
      stroke(fg);
      if (angle % 360 == 0) {
        fill(fg);
        bang = 1;
      } else {
        fill(bg);
        bang = 0;
      }
      push();
      rotate(radians(angle));
      ellipse(0, 0, 40, 40);
      rect(-2, -20, 4, 12);
      noStroke();
      fill(0);
      rect(-1, -22, 2, 4); 
      pop();
    }
  }
}
