boolean helpIsActive = false;

void helpScreen() {
  stroke(fg);
  translate(width/2 - 400, height/2 - 300);
  fill(bg);
  rect(0, 0, 800, 600);
  fill(fg);
  textSize(15);
  text("Tu connais l'histoire de l'homme à neuf jambes ?\nNon.\nMoi non plus, il s'est enfui.", 20, 20);

}
