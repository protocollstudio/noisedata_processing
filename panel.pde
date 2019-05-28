// display a panel
class Panel {
   float x, y, w, h; // origin of the window doesn't include the title bar.
   String title;
   String address; // osc address
   
   Panel(String aTitle, float aX, float aY, float aW, float aH) {
     title = aTitle;
     // align panel to grid
     x = aX * cellSize;
     y = aY * cellSize;
     w = aW * cellSize;
     h = aH * cellSize;
     address = "/" + title; // use panel title to define osc address
   }
   
   void display() {
      noFill();
      stroke(240);
      translate(x, y);
      rect(0, 0, w, h);
      fill(40);
      rect(0, -20, w, 20);
      fill(255);
      textSize(12);
      text(title, 5, -7);
   }
}