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
  if (fg = 255) {
    fg = 0;
  } else {
    fg = 255;
  }
  if (bg = 0) {
    bg = 255;
  } else {
    bg = 0;
  }
}
