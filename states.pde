// handle scenes

void states(int state) {
  switch (state) {
  case 1 : 
    line2.run();
    sequence1.run();
    break;
  case 2 : 
    gate1.run();
    break;
  case 3 :
    //gate1.run();
    gate2.run();
    break;
  case 4 : 
    distance.run();
    break;
  case 5 :
    gate3.run();
    gate4.run();
    break;
  case 6 : 
    distance.run();
    gate1.run();
    gate2.run();
    line1.run();
    break;
  case 7 : 
    distance.run();
    gate1.run();
    gate2.run();
    gate3.run();
    gate4.run();
    line1.run();
    line2.run();
  }
}
