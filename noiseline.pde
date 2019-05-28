// Module : random value
class Line extends Panel {

  int nbPoints = 100;
  float noiseFactor = 0;
  float step = 0.02;
  float noiseStart = 0;
  private int[] noiseCurve = new int[nbPoints];
  private OscMessage oscMessage;

  Line(String title, float aX, float aY, float aW, float aH) {
    super(title, aX, aY, aW, aH);
  }

  void run() {
    push();
    display();
    render();
    pop();
    send(map(noiseCurve[nbPoints-1], 0, panelH, 1, 0));
  }

  private void render() {
    stroke(255);
    noFill();
    for (int i = 0; i < nbPoints; i++) {
      noiseCurve[i] = int(map(noise(noiseFactor), 0, 1, 0, panelH));
      noiseFactor += step;
    }
    beginShape();
    curveVertex(-(panelW / nbPoints), noiseCurve[0]);
    for (int i = 0; i < nbPoints; i++) {
      float posX = i * (panelW / nbPoints);
      float posY = noiseCurve[i];
      curveVertex(posX, posY);
    }
    curveVertex(panelW, noiseCurve[nbPoints-1]);
    endShape();
    noiseStart += step;
    noiseFactor = noiseStart;
    stroke(150);
    line(0, noiseCurve[nbPoints-1], panelW, noiseCurve[nbPoints-1]);
  }

  // ... to be abstracted in OSC layer
  private void send(float information) {
    oscMessage = new OscMessage(address);
    oscMessage.add(information);
    osc.send(oscMessage, remote);
  }
}
