// empty example module
class ModuleExample extends Panel{

  String address;
  private OscMessage m; // OR private OscMessage[] messages

 // add global variables of your sketch here

  ModuleExample(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);
  
   // insert your sketch setup here

  }
  
  void run() {
    push();
    display();
    render();
    pop();
    send();
  }

  void render() {
   // insert your sketch draw function here
  }

  void send() {
    m = new OscMessage(address);
    m.add();
    osc.send(m, remote);
  }
}
