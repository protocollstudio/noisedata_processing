// Base Module Class

abstract class Module extends Panel {
  // PROPERTIES

  // CONSTRUCTORS

  Module(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);
  }
  // FUNCTIONS

  void run() {
    push();
    display();
    render();
    pop();
    send();
  }

  public abstract void render();

  public abstract void send();
}
