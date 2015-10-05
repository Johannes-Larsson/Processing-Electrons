// start x, start y, width, height, file name, the background color of your program, and whether to make the background transparent in the saved image
void savePicture(int sx, int sy, int w, int h, String name, int background, boolean removeBackground) {
  PImage p = createImage(w, h, ARGB);
  
   for (int x = sx; x < sx + w; x++) {
    for (int y = sy; y < sy + h; y++) {
      color c = get(x, y);
      if (removeBackground && c == background) c = color(0, 0);
      p.pixels[(y - sy) * w + x - sx] = c;
    }
  }
  p.updatePixels();
  p.save(name);
}