public class SaveButton extends AbstractActiveElement
{
  final int NONE = 200, HOVER = 230, CLICKED = 255;
  int state;
  int x, y, w, h;
  int col;
  
  public SaveButton() {
    this(950, 0, 50, 20);
    println("created");
    Interactive.add(this);
  }
  
  public SaveButton(int x, int y, int w, int h) {
    super(x, y, w, h);
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    state = NONE;
  }
  
  public void mousePressed ( ) {
    state = CLICKED;
    if (filename.getText() != "") a.save(filename.getText());
  }
  
  public void mousePressed (float mx, float my) { 
  }
  
  public void mouseDoubleClicked() {
  }
  
  public void mouseDoubleClicked(float mx, float my) {
  }
  
  public void mouseDragged(float mx, float my) {
  }
  
  public void mouseDragged(float mx, float my, float dx, float dy) {
  }
  
  public void mouseReleased() {
    state = HOVER;
  }
  
  public void mouseReleased(float mx, float my) {
  }
  
  public void mouseEntered() {
    state = HOVER;
  }
  
  public void mouseExited() {
    state = NONE;
  }
  
  void draw() {
    fill(state);
    stroke(0);
    rect(x, y, w, h);
    fill(0);
    text("save", x + 12, y + h - 5);
  }
}

public class TextField extends AbstractActiveElement
{
  int x, y, w, h;
  ArrayList<Character> text;
  boolean active;
  
  public TextField() {
    this(0, 0, 950, 20);
  }
  
  public TextField(int x, int y, int w, int h) {
    super(x, y, w, h);
    text = new ArrayList<Character>();

    this.x = x; 
    this.y = y;
    this.w = w;
    this.h = h;
    
    Interactive.add(this);
  }
  
  void mousePressed() {
    active = !active;
  }
  
  public void keyPressed(char key) {
    if (active) {
      if (key >= 32 && key < 127) text.add(new Character(key));
      else if (key == 8 && text.size() > 0) text.remove(text.size() - 1); // 8 is the keycode for backspace
    }
  }
  
  public String getText() {
    char[] c = new char[text.size()];
    for (int i = 0; i < text.size(); i++) {
      c[i] = text.get(i).charValue();
    }
    return new String(c);
  }
  
  public void mousePressed (float mx, float my) { 
  }
  
  public void mouseDoubleClicked() {
  }
  
  public void mouseDoubleClicked(float mx, float my) {
  }
  
  public void mouseDragged(float mx, float my) {
  }
  
  public void mouseDragged(float mx, float my, float dx, float dy) {
  }
  
  public void mouseReleased() {
  }
  
  public void mouseReleased(float mx, float my) {
  }
  
  public void mouseEntered() {
  }
  
  public void mouseExited() {
  }
  
  public void draw() {
    fill(active ? 220 : 200);
    stroke(0);
    rect(x, y, w, h);
    fill(0);
    text(getText(), x + 12, y + h - 5);
  }
}