// handle scenes

void states(int state) {
  switch (state) { 
  case 1 : 

    line.run();
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
    line.run();
    break;
  }
}
