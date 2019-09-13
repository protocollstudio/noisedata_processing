// oscP5 library
import netP5.*;
import oscP5.*;
OscP5 osc;
NetAddress remote;

// Global appearance
int fg = 255;
int bg = 0;
PFont font;
int cellSize; // size of grid cells, interface snaps to this resolution

void setup() {

  // choose multiple of cellSize for window resolution
  size(1290, 900);
  //fullScreen();
  cellSize = 10;
  
  font = createFont("Inconsolata.ttf", 12);
  textFont(font);
  
  // OSC setup
  osc = new OscP5(this, 4444); // receive on port 4444
  remote = new NetAddress("127.0.0.1", 7777); // send on port 7777
  
  sceneSetup();
}

void draw() {
   background(bg);
   sceneDisplay();
   if (helpIsActive) {
      helpScreen(); 
   }
}
