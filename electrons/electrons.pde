String saveAs = "";

Atom a;

void setup() {
  size(1000, 1000);
  noFill();
  int[] atomModel = new int[] { 2, 3 }; // where each int is the next layer, and the number is the number of electrons in that layer.
  a = new Atom(atomModel);
}

void draw() { 
  background(#a0a0a0);
  text("Type a name for the file, and press enter to save. \nSave as: " + saveAs, 10, 10);
  
  a.draw(new PVector(width, height).div(2));
}

void keyPressed() {
  // 10 is the keycode for Enter
  if (keyCode == 10) {
    a.save(saveAs);
  } else if (keyCode == 8) {
    if (saveAs.length() > 0) {
      saveAs = saveAs.substring(0, saveAs.length() - 1);
      println("removing, sa"); 
    }
  } else {
    saveAs += key;
  }
  
  println(keyCode);
}