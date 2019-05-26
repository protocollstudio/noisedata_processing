// TODO factory design pattern for Panels
class Gui {
    ArrayList<Panel> panels;
    
    Gui() {
      
    }
    
    void addPanel() {
        
    }
}

// display a window
class Panel {
   float x, y, w, h; // origin of the window doesn't include the title bar.
   String title;
   String address; // osc address
   
   Panel(String aTitle, float aX, float aY, float aW, float aH) {
     title = aTitle;
     x = aX;
     y = aY;
     w = aW;
     h = aH;
     address = "/" + title; // use panel title to define osc address
   }
   
   void display() {
      noFill();
      stroke(240);
      translate(x, y);
      rect(0, 0, w, h);
      fill(40);
      rect(0, -16, w, 16);
      fill(255);
      text(title, 5, -5);
   }
}
