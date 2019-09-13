// main scene
// a scene is a set of displayed modules

Lfo lfo0, lfo1, lfo2, lfo3;
Ball gate0, gate1, gate2, gate3;
Distance distance;
Sequencer sequencer;

void sceneSetup() {
  lfo0 = new Lfo("LFO0", "sin", 2, 4, 30, 13);
  lfo0.setStep(4);
  lfo1 = new Lfo("LFO1", "rnd", 2, 20, 30, 13);
  lfo1.setStep(0.02);
  lfo2 = new Lfo("LFO2", "rnd", 2, 36, 30, 13);
  lfo2.step = 0.05;
  lfo3 = new Lfo("LFO3", "sin", 2, 52, 30, 13);
  lfo3.step = 11;
  gate0 = new Ball("GATE0", 2, 68, 20, 20);
  gate0.velocity = new PVector(0.7, 0.9);
  gate1 = new Ball("GATE1", 23, 68, 20, 20);
  gate1.velocity = new PVector(1, -1.4);
  gate2 = new Ball("GATE2", 44, 68, 20, 20);
  gate2.velocity = new PVector(-1.8, 1.5);
  gate3 = new Ball("GATE3", 65, 68, 20, 20);
  gate3.velocity = new PVector(-2, -2.5);
  distance = new Distance("NODES", 33, 4, 94, 61);
  sequencer = new Sequencer("SEQUENCER", 86, 68, 41, 20);
}

//void mainSceneSetup() {
//  line0 = new Line("LINE0", 2, 4, 25, 10);
//  line0.step = 0.005;
//  line1 = new Line("LINE1", 2, 17, 25, 10);
//  line1.step = 0.01;
//  line2 = new Line("LINE2", 2, 30, 25, 10);
//  line2.step = 0.03;
//  line3 = new Line("LINE3", 2, 43, 25, 10);
//  line3.step = 0.07;
//  gate0 = new Ball("GATE0", 2, 56, 15, 15);
//  gate0.velocity = new PVector(0.7, 0.9);
//  gate1 = new Ball("GATE1", 18, 56, 15, 15);
//  gate1.velocity = new PVector(1, -1.4);
//  gate2 = new Ball("GATE2", 34, 56, 15, 15);
//  gate2.velocity = new PVector(-1.8, 1.5);
//  gate3 = new Ball("GATE3", 50, 56, 15, 15);
//  gate3.velocity = new PVector(-2, -2.5);
//  distance = new Distance("NODES", 28, 4, 79, 49);
//  sequence = new Pot("SEQUENCE", 66, 56, 41, 15);
//}

void sceneDisplay() {
  lfo0.run();
  lfo1.run();
  lfo2.run();
  lfo3.run();
  gate0.run();
  gate1.run();
  gate2.run();
  gate3.run();
  distance.run();
  sequencer.run();
}
