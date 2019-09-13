// LFO module

class Lfo extends Module {

  // PROPERTIES
  String type; // type of signal
  int nbPoints; // increase nbPoints = increase quality = slower
  float factor;
  float step;
  float start;
  private int[] signal;
  private OscMessage oscMessage;

  // CONSTRUCTORS

  Lfo  (String aTitle,
        String aType,
        float aXcoord,
        float aYcoord,
        float aWidth,
        float aHeight) {
          
    super(aTitle, aXcoord, aYcoord, aWidth, aHeight);
    nbPoints = 50;
    factor = 0;
    step = 4;
    start = 0;
    type = aType;
    signal = new int[nbPoints];
  }
  
  // GETTERS / SETTERS
  
  public float getStep() {
    return step;  
  }
  
  public void setStep(float aStep) {
      step = aStep;
  }
  
  // FUNCTIONS
  
  void render() {
     stroke(fg);
     noFill();
     for (int i = 0; i < nbPoints; i++) {
       switch(type) {
        case "sin" : signal[i] = int(map(sin(radians(factor)), -1, 1, 0, panelH));
        break;
        case "tri" : signal[i] = 0;
        break;
        case "saw" : signal[i] = 0;
        break;
        case "rnd" : signal[i] = int(map(noise(factor), 0, 1, 0, panelH));
        break;
       }
       factor += step;
     }
     beginShape();
     curveVertex(-(panelW / nbPoints), signal[0]);
     for (int i = 0; i < nbPoints; i++) {
        float posX = i * (panelW / nbPoints);
        float posY = signal[i];
        curveVertex(posX, posY);
     }
     curveVertex(panelW, signal[nbPoints - 1]);
     endShape();
     start += step;
     factor = start;
     line(0, signal[nbPoints - 1], panelW, signal[nbPoints - 1]);
  }
  
  void send() {
     oscMessage = new OscMessage(address);
     oscMessage.add(map(signal[nbPoints - 1], 0, panelH, 1, 0));
     osc.send(oscMessage, remote);
  }
}
