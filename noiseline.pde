class Line extends Panel {

  int nbPoints;
  float noiseFactor;
  float step;
  float noiseStart;
  private int[] noiseCurve;
  private OscMessage m;

  Line(String title, float aX, float aY, float aW, float aH) {
    super(title, aX, aY, aW, aH);
    nbPoints = 50;
    noiseFactor = 0;
    step = 0.02;
    noiseStart = 0;
    noiseCurve = new int[nbPoints];
  }

  void run() {
    render();
    send();
  }

  private void render() {
    push();
    display();

    stroke(255);
    noFill();
    for (int i = 0; i < nbPoints; i++) {
      noiseCurve[i] = int(map(noise(noiseFactor), 0, 1, 0, h));
      noiseFactor += step;
    }
    beginShape();
    curveVertex(-(w / nbPoints), noiseCurve[0]);
    for (int i = 0; i < nbPoints; i++) {
      float posX = i * (w / nbPoints);
      float posY = noiseCurve[i];
      curveVertex(posX, posY);
    }
    curveVertex(w, noiseCurve[nbPoints-1]);
    endShape();
    noiseStart += step;
    noiseFactor = noiseStart;
    stroke(150);
    line(0, noiseCurve[nbPoints-1], w, noiseCurve[nbPoints-1]);
    pop();
  }

  private void send() {
    m = new OscMessage(address);
    m.add(map(noiseCurve[nbPoints-1], 0, h, 1, 0));
    osc.send(m, remote);
  }
}
