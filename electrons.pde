void setup() {
  size(1000, 1000);
  background(#a0a0a0);
  noFill();
  drawAtom(new PVector(width / 2, height / 2), new int[] { 1 });
}

final float RAD_PER_LAYER = 30;
final float CORE_SIZE = 25;
final float ELECTRON_SIZE = 12;

void drawAtom(PVector center, int[] layers) {
  noFill();
  int sum = 0;
  float radius = RAD_PER_LAYER;
  for (int i : layers) {
    sum += i;
    radius += RAD_PER_LAYER;
    drawLayer(center, radius, i);
  }
  drawCore(center, sum);
  
  int size = (int)((layers.length + 1) * RAD_PER_LAYER * 2 + ELECTRON_SIZE + 5);
  
  int c = (int)(center.x - size / 2);
  savePicture(c, c, size, size, "Atom.png");
}

void savePicture(int sx, int sy, int w, int h, String name) {
  PImage p = createImage(w, h, ARGB);
  
   for (int x = sx; x < sx + w; x++) {
    for (int y = sy; y < sy + h; y++) {
      color c = get(x, y);
      if (c == #a0a0a0) c = color(0, 0);
      p.pixels[(y - sy) * w + x - sx] = c;
    }
  }
  p.updatePixels();
  p.save(name);
}

void drawLayer(PVector center, float radius, int electrons) {
  ellipse(center.x, center.y, radius * 2, radius * 2);
  float deltaA = TAU / electrons;
  for (int i = 0; i < electrons; i++) {
    PVector pos = PVector.fromAngle(deltaA * i);
    pos.mult(radius);
    drawElectron(pos.add(center));
  }
}

void drawElectron(PVector pos) {
  fill(255);
  ellipse(pos.x, pos.y, ELECTRON_SIZE, ELECTRON_SIZE);
  fill(0);
  text("e-", pos.x - 4, pos.y + 4);
  noFill();
}

void drawCore(PVector center, int sum) {
  fill(255);
  ellipse(center.x, center.y, CORE_SIZE, CORE_SIZE);
  fill(0);
  text(sum + "+", center.x - 7, center.y + 5);
}