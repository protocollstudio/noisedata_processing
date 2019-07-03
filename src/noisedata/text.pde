
class Text extends Panel {


  // ******************** ---------- *******************
  // ******************** PROPERTIES *******************
  // ******************** ---------- *******************

  String address;
  private OscMessage m;


  // ******************** ------------ *******************
  // ******************** CONSTRUCTORS *******************
  // ******************** ------------ *******************

  Text(String title, float x, float y, float w, float h) {
    super(title, x, y, w, h);
  }


  // ******************** --------- *******************
  // ******************** FUNCTIONS *******************
  // ******************** --------- *******************

  void run() {
    render();
    send();
  }

  void render() {
    push();
    display();
    pop();
  }

  void send() {
    m = new OscMessage(address);
    m.add( );
    osc.send(m, remote);
  }
}
