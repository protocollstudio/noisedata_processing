void keyPressed() {
  
  // display help window
  if (key == 'h' || key == 'H') {
    if (helpIsActive == false) {
       helpIsActive = true; 
    } else {
      helpIsActive = false;
    }
  }

  // change theme
  if (key == 'c' || key == 'C') {
    changeTheme();
  }
  
  // distance parameters
  if (key == 'a' || key == 'A') {
    println("A key. Nodes = " + distance.nbNodes);
    distance.addNode();
  }
  if (key == 'r' || key =='R') {
    distance.removeNode();
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
  if (key == '-') {
    if (distance.mode == "noise") {
      distance.step -= 0.01;
    }
    if (distance.mode == "lissajous") {
      distance.freqB -= 0.01;
    }
  }
  if (key == '+') {
    if (distance.mode == "noise") {
      distance.step += 0.01;
    }
    if (distance.mode == "lissajous") {
      distance.freqB += 0.01;
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
