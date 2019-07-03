class Pot extends Panel {


  // ******************** ---------- *******************
  // ******************** PROPERTIES *******************
  // ******************** ---------- *******************

  int nbRotaries;
  Rotary[] rotaries;

  String address;
  private OscMessage[] messages;


  // ******************** ------------ *******************
  // ******************** CONSTRUCTORS *******************
  // ******************** ------------ *******************

  Pot(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);

    nbRotaries = 6;
    rotaries = new Rotary[nbRotaries];

    for (int i = 0; i < nbRotaries; i++) {
      rotaries[i] = new Rotary(i+1);
    }
  }


  // ******************** ----------------- *******************
  // ******************** GETTERS / SETTERS *******************
  // ******************** ----------------- *******************




  // ******************** --------- *******************
  // ******************** FUNCTIONS *******************
  // ******************** --------- *******************

  void run() {
    push();
    display();
    render();
    pop();
    send();
  }

  void render() {
    translate(55, 0);

    for (int i = 0; i < nbRotaries; i++) {
      push();
      translate(i*60, panelH/2);
      rotaries[i].run();
      pop();
    }

  }

  void send() {
    messages = new OscMessage[nbRotaries];
    for (int i = 0; i < nbRotaries; i++) {
      messages[i] = new OscMessage("/pot" + i);
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
      angle = (round(random(180)))*2;
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
      ellipse(0, -30, 5, 5);
      if (angle % 360 >= 0 && angle % 360 <= 8) {
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
