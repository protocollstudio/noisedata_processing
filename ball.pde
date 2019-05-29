class Ball extends Panel {
  
  PVector pos, vel;
  float radius = 10;
  private OscMessage m;
  private int hit;

  Ball(String title, float aX, float aY, float aW, float aH) {
    super(title, aX, aY, aW, aH);
    pos = new PVector(w/2, h/2);
    vel = new PVector(random(2, 6), random(2,6));
  }

  void run() {
    render();
    send();
  }

  private void render() {
    push();
    display();
    noFill();
    stroke(fg);
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, radius*2, radius*2);
    hit = 0;
    pos.add(vel);
    if (pos.x - radius < 0 || pos.x + radius > w) {
      hit = 1;
      vel.x *= -1;
    }
    if (pos.y + radius > h || pos.y - radius < 0) { 
      hit = 1;
      vel.y *= -1;
    }
    pop();
  }

  private void send() {
    m = new OscMessage(address);
    m.add(hit);
    osc.send(m, remote);
  }
}
