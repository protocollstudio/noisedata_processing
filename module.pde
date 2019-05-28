// empty example module
class Module extends Panel{
  
  String address;
  private OscMessage m;
 // add global variables of your sketch here 

  Module(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);
   // insert your sketch setup here 
  }
  
  void run() {
    render();
    send();
  }
  
  void render() {
    push();
    display();
   // insert your sketch draw function here
    pop();
  }
  
  void send() {
    m = new OscMessage(address);
    m.add( );
    osc.send(m, remote);
  }
}
