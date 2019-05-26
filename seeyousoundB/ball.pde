class Ball extends Panel {
  PVector pos, vel;
  float radius = 10;
  private OscMessage m;
  private int hit;

  Ball(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);
    pos = new PVector(w/2, h/2);
    vel = new PVector(random(2, 6), random(2,6));
  }

  void run() {
    render();
    send();
  }

  void render() {
    push();
    display();
    hit = 0;
    pos.add(vel);
    if (pos.x - radius <= 0 || pos.x + radius >= w) {
      hit = 1;
      vel.x *= -1;
    }
    if (pos.y + radius >= h || pos.y - radius <= 0) { 
      hit = 1;
      vel.y *= -1;
    }
    noFill();
    stroke(255);
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, radius*2, radius*2);
    pop();
  }

  private void send() {
    m = new OscMessage(address);
    m.add(hit);
    osc.send(m, remote);
  }
}
