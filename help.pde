boolean helpIsActive = true;

void helpScreen() {
  stroke(fg);
  translate(width/2 - 450, height/2 - 300);
  fill(bg);
  rect(0, 0, 900, 600);
  fill(fg);
  text("NOISE:DATA", 20, 30);
  textSize(14);
  text("Each window send an OSC signal on port 7777.", 20, 80);
  text("LFOs send a continuous signals between zero and one on address /LFOx (title of the window).", 20, 110);
  text("GATEs send a bang, a integer switching from zero to one, each time the ball hits the wall on address /GATEx.", 20, 140);
  text("SEQUENCER send bangs each time a rotary is at twelve o'clock on address /POTx (x is between 0 and 5)", 20, 170);
  text("Instructions of NODES are always displayed. Signal are continuous, between zero and one.\nThe addresses are /NODEx (x is the number of the node.", 20, 200);
  text("@protocollstudio", 20, 260);
  text("Next steps : scene & window management, modules & communication configuration...", 20, 290);
  text("Press h to (un)display help screen.", 20, 540);
  text("Press c to change theme (dark/light mode)", 20, 570);

}
