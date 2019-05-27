void keyPressed() {
  // cursore movement
  if (key == 'h') { c.x -= cellSize; }
  if (key == 'j') { c.y += cellSize; }
  if (key == 'k') { c.y -= cellSize; }
  if (key == 'l') { c.x += cellSize; }
  if (keyCode == UP) { c.y -= cellSize * 10; }
  if (keyCode == RIGHT) { c.x += cellSize * 10; }
  if (keyCode == DOWN) { c.y += cellSize * 10; }
  if (keyCode == LEFT) { c.x -= cellSize * 10; }
  c.x = constrain(c.x, 0, width-cellSize);
  c.y = constrain(c.y, 0, height-cellSize);

  // handle states
  if (key == '1') { state = 1; }
  if (key == '2') { state = 2; }
  if (key == '3') { state = 3; }
  if (key == '4') { state = 4; }
  if (key == '5') { state = 5; }
}