// handle scenes

void states(int state) {
  switch (state) { 
  case 0 :
    break;
  case 1 : 

    line1.run();
    break;
  case 2 : 

    gate1.run();
    break;
  case 3 :
    gate2.run();
    break;
  case 4 : 
    distance.run();
    break;

  case 5 : 
    distance.run();
    gate1.run();
    gate2.run();
    line1.run();
    break;
  }
}
