// useful global functions

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popMatrix();
  popStyle();
}

void changeTheme() {
  if (fg == 255 && bg == 0) {
    fg = 0;
    bg = 255;
  } else {
    fg = 255;
    bg = 0;
  }
}
