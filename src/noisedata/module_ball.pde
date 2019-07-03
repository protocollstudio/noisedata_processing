// Module : bouncing ball
class Ball extends Panel {

  PVector position, velocity;

  float radius = 10;
  private OscMessage oscMessage;
  private int hit;

  Ball(String title, float aX, float aY, float aW, float aH) {
    super(title, aX, aY, aW, aH);

    position = new PVector(panelW/2, panelH/2);
    velocity = new PVector(random(2, 6), random(2,6));
  }

  void run() {
    push();
    display();
    render();
    pop();
    send(hit);
  }

  private void render() {
    hit = 0;

    // move the ball
    position.add(velocity);

    // when it hits the border
    if (position.x - radius < 0 || position.x + radius > panelW) {
      hit = 1;
      velocity.x *= -1;
    }
    if (position.y + radius > panelH || position.y - radius < 0) {
      hit = 1;
      velocity.y *= -1;
    }

    // draw the ball
    noFill();
    stroke(fg);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, radius*2, radius*2);

  }

  // ... to be abstracted in OSC layer
  private void send(int information) {
    oscMessage = new OscMessage(address);
    oscMessage.add(information);
    osc.send(oscMessage, remote);
  }

  void setPosition(float aX, float aY, float aW, float aH) {
    panelX = aX * cellSize;
    panelY = aY * cellSize;
    panelW = aW * cellSize;
    panelH = aH * cellSize;
    //pos = new PVector(w/2, h/2);
    //vel = new PVector(random(2, 6), random(2, 6));
  }
}
