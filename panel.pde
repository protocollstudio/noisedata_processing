// panel class

abstract class Panel {
  // PROPERTIES

  // panel size & origin
  // doesn't include the title bar
  float panelX, panelY, panelW, panelH;
  String title;
  String address; // OSC address

  // CONSTRUCTORS

  Panel (String aTitle, float aXcoord, float aYcoord, float aWidth, float aHeight) {
    title = aTitle;
    // align panel to grid;
    panelX = aXcoord * cellSize;
    panelY = aYcoord * cellSize;
    panelW = aWidth * cellSize;
    panelH = aHeight * cellSize;
    address = "/" + title;
  }

  // FUNCTIONS

  void display() {
    // main box
    noFill(); 
    stroke(fg);
    translate(panelX, panelY);
    rect(0, 0, panelW, panelH);

    // title box
    fill(bg);
    rect(0, -2*cellSize, panelW, 2 * cellSize);
    fill(fg);
    textSize(12);
    text(title, 5, -7);
  }

  void setPosition(float aXcoord, float aYcoord, float aWidth, float aHeight) {
    panelX = aXcoord * cellSize;
    panelY = aYcoord * cellSize;
    panelW = aWidth * cellSize;
    panelH = aHeight * cellSize;
  }
  
  public abstract void run();
}
