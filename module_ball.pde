// Module : bouncing ball

class Ball extends Module {
  
  // PROPERTIES

  PVector position, velocity;
  float radius = 15;

  private OscMessage oscMessage;
  private int hit;

  // CONSTRUCTORS

  Ball  (String title, 
        float aX, 
        float aY, 
        float aW, 
        float aH) {
          
    super(title, aX, aY, aW, aH);

    position = new PVector(panelW / 2, panelH / 2);
    velocity = new PVector(random(2, 6), random(2, 6));
  }
  // GETTERS / SETTERS

  public float getRadius() {
    return radius;
  }
  public void setRadius(float aRadius) {
    radius = aRadius;
  }


  // FUNCTIONS

  void render() {
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
  void send() {
    oscMessage = new OscMessage(address);
    oscMessage.add(hit);
    osc.send(oscMessage, remote);
  }

  void setPosition(float aX, float aY, float aW, float aH) {
    panelX = aX * cellSize;
    panelY = aY * cellSize;
    panelW = aW * cellSize;
    panelH = aH * cellSize;
  }
}
