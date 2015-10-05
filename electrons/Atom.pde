class Atom 
{
  private final static float RAD_PER_LAYER = 30;
  private final static float CORE_SIZE = 25;
  private final static float ELECTRON_SIZE = 12;
  
  private int[] model;
  
  private PVector drawnAt;
  private boolean isDrawn;
    
  public Atom(int[] model) {
    this.model = model;
  }
  
  public void save(String name) {
    if (!isDrawn) {
      println("you need to draw the atom before saving it!");
      return;
    }
    int size = (int)((model.length + 1) * RAD_PER_LAYER * 2 + ELECTRON_SIZE + 5);
    int c = (int)(drawnAt.x - size / 2);
    savePicture(c, c, size, size, name + ".png", #a0a0a0, true);
  }
  
  public void draw(PVector center) {
    isDrawn = true;
    drawnAt = center;
    
    noFill();
    int sum = 0;
    float radius = RAD_PER_LAYER;
    for (int i : model) {
      sum += i;
      radius += RAD_PER_LAYER;
      drawLayer(center, radius, i);
    }
    drawCore(center, sum);
  }
  
  private void drawLayer(PVector center, float radius, int electrons) {
    ellipse(center.x, center.y, radius * 2, radius * 2);
    float deltaA = TAU / electrons;
    for (int i = 0; i < electrons; i++) {
      PVector pos = PVector.fromAngle(deltaA * i);
      pos.mult(radius);
      drawElectron(pos.add(center));
    }
  }

  private void drawElectron(PVector pos) {
    fill(255);
    ellipse(pos.x, pos.y, ELECTRON_SIZE, ELECTRON_SIZE);
    fill(0);
    text("e-", pos.x - 4, pos.y + 4);
    noFill();
  }
  
  private  void drawCore(PVector center, int sum) {
    fill(255);
    ellipse(center.x, center.y, CORE_SIZE, CORE_SIZE);
    fill(0);
    text(sum + "+", center.x - 7, center.y + 5);
  }
}