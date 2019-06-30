// display a panel
class Panel {
   float panelX, panelY, panelW, panelH; // origin of the window doesn't include the title bar.
   String title;
   String address; // osc address
   boolean isActive = true;

   Panel(String aTitle, float aXcoord, float aYcoord, float aWidth, float aHeight) {
     title = aTitle;
     // align panel to grid
     panelX = aXcoord * cellSize;
     panelY = aYcoord * cellSize;
     panelW = aWidth * cellSize;
     panelH = aHeight * cellSize;
     address = "/" + title; // use panel title to define osc address
   }

   void display() {
      // main box
      noFill();
      stroke(240);
      translate(panelX, panelY);
      rect(0, 0, panelW, panelH);

      // title box
      fill(40);
      rect(0, -20, panelW, 20);
      fill(255);
      textSize(12);
      text(title, 5, -7);
   }

  void setPosition(float aXcoord, float aYcoord, float aWidth, float aHeight) {
     panelX = aXcoord * cellSize;
     panelY = aYcoord * cellSize;
     panelW = aWidth * cellSize;
     panelH = aHeight * cellSize;
  }
}
