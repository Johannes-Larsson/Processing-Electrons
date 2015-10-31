import processing.svg.*;

import de.bezier.guido.*;

String saveAs = "";

Atom a;

TextField filename;

void setup() {
  size(1000, 1000);
  Interactive.make(this);
  noFill();
  int[] atomModel = new int[] { 2, 3 }; // where each int is the next layer, and the number is the number of electrons in that layer.
  a = new Atom(atomModel);
  new SaveButton();
  filename = new TextField();
}

void draw() { 
  background(#a0a0a0);
  //text("Type a name for the file, and press enter to save. \nSave as: " + saveAs, 10, 10);
  
  a.draw(new PVector(width, height).div(2));
}

void keyPressed() {
  filename.keyPressed(key); // guido doesn't seem to pass on keyboard events
}