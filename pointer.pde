// moving pointer
class Pointer {
  int x, y;

  Pointer() {
    x = 0;
    y = 0;
  }
  
  void display() {
    noStroke();
    fill(255, 100);
    rect(x, y, cellSize, cellSize);
  }
}
