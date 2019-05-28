// display grid
void grid() {
  int rows = height / cellSize;
  int cols = width / cellSize;
  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      stroke(50);
      point(i * cellSize, j * cellSize);
    }
  }
}
