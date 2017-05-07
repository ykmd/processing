class Block {
  Position pos;
  int width, height;
  boolean transpass;
  
  Block(int posX, int posY, int w, int h) {
    pos = new Position(posX, posY);
    width = w;
    height = h;
    transpass = false;
  }
  
}