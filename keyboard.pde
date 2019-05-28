void keyPressed() {
  // cursore movement
  if (key == 'h') { 
    c.x -= cellSize;
  }
  if (key == 'j') { 
    c.y += cellSize;
  }
  if (key == 'k') { 
    c.y -= cellSize;
  }
  if (key == 'l') { 
    c.x += cellSize;
  }
  //if (keyCode == UP) { 
  //  c.y -= cellSize * 10;
  //}
  //if (keyCode == RIGHT) { 
  //  c.x += cellSize * 10;
  //}
  //if (keyCode == DOWN) { 
  //  c.y += cellSize * 10;
  //}
  //if (keyCode == LEFT) { 
  //  c.x -= cellSize * 10;
  //}
  c.x = constrain(c.x, 0, width-cellSize);
  c.y = constrain(c.y, 0, height-cellSize);

  // handle states
  if (key == '1') { 
    state = 1;
  }
  if (key == '2') { 
    state = 2;
  }
  if (key == '3') { 
    state = 3;
  }
  if (key == '4') { 
    state = 4;
  }
  if (key == '5') { 
    state = 5;
  }

  // distance parameters
  if (key == 'a' || key == 'A') {
    println("A key. Nodes = " + distance.nbNodes);
    distance.nbNodes++;
    distance.createNodes();
  }
  if (key == 'r' || key =='R') {
    distance.nbNodes--;
    distance.createNodes();
  }
  if (key == 'm' || key == 'M') {
    distance.mode = "mouse";
  }
  if (key == 'n' || key == 'N') {
    distance.mode = "noise";
  }
  if (key == 'l' || key == 'L') {
    distance.mode = "lissajous";
  }
   if (distance.mode == "lissajous") {
      distance.freqB += 0.01;
    }
  if (key == '-') {
    if (distance.mode == "noise") {
      distance.step -= 0.01;
    }
    if (distance.mode == "lissajous") {
      distance.freqB -= 0.01;
    }
  }
  if (key == 'i' || key == 'I') {
    if (distance.mode == "noise") {
      distance.speed += 0.1;
    }
    if (distance.mode == "lissajous") {
      distance.freqA += 0.01;
    }
  }
  if (key == 'd' || key == 'D') {
    if (distance.mode == "noise") {
      distance.speed -= 0.1;
    }
    if (distance.mode == "lissajous") {
      distance.freqA -= 0.01;
    }
  }
  if (distance.mode == "lissajous") {
    if (keyCode == LEFT) {
      distance.phaseA -= 1;
    }
    if (keyCode == RIGHT) {
      distance.phaseA += 1;
    }
    if (keyCode == UP) {
      distance.phaseB += 1;
    }
    if (keyCode == DOWN) {
      distance.phaseB -= 1;
    }
  }
}
