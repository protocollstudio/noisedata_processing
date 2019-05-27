void states(int state) {
    switch (state) { 
    case 1 : 
        n.run();
        break;
    case 2 : 
        b1.run();
        break;
    case 3 :
        b2.run();
        break;
    case 4 : 
        d.run();
        break;
    }
}