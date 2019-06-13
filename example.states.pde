// handle scenes

void states(int scene) {
  switch (scene) {
  case 1 : 
    line0.setPosition(2, 4, 25, 10);
    line0.run();
    line1.setPosition(2, 17, 25, 10);
    line1.run();
    line2.setPosition(2, 30, 25, 10);
    line2.run();
    line3.setPosition(2, 43, 25, 10);
    line3.run();
    gate0.setPosition(2, 56, 15, 15);
    gate0.run();
    gate1.setPosition(18, 56, 15, 15);
    gate1.run();
    gate2.setPosition(34, 56, 15, 15);
    gate2.run();
    gate3.setPosition(50, 56, 15, 15);
    gate3.run();
    distance.setPosition(28, 4, 79, 49);
    distance.run();
    sequence.setPosition(66, 56, 41, 15);
    sequence.run();
    break;
  case 2 : 
    distance.setPosition(4, 10, 100, 52);
    distance.run();
    break;
  case 3 :
    //gate0.setPosition(24, 25, 28, 22);
    gate3.run();
    //gate1.setPosition(53, 25, 28, 22);
    line1.run();
    break;
  case 4 : 
    sequence.setPosition(20, 10, 41, 15);
    sequence.run();
    line2.run();
    break;
  case 5 :
    gate3.run();
    gate2.run();
    break;
  case 6 : 
    distance.run();
    gate1.run();
    gate2.run();
    line1.setPosition(40, 30, 30, 20);
    line1.run();
    break;
  case 7 : 
    sequence.run();
    gate1.run();
    gate2.run();
    gate3.run();
    gate0.run();
    line1.run();
    line2.run();
  }
}
