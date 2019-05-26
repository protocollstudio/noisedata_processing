class NoiseLine extends Panel {

  int nbPoints;
  float noiseFactor;
  float step;
  float noiseStart;
  private int[] noiseCurve;
  private OscMessage m;

  NoiseLine(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);
    nbPoints = 200;
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
    for (int i = 0; i < nbPoints; i++) {
      float posX = i * (w / nbPoints);
      float posY = noiseCurve[i];
      curveVertex(posX, posY);
    }
    noiseStart += step;
    noiseFactor = noiseStart;
    endShape();
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
