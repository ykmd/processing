class Bg {
  PImage bg1, bg2;
  int pos1X = 0;
  int pos2X = 2800;
  float speed = 1;
  
  Bg() {
    bg1 = loadImage("Bg1.png");
    bg2 = loadImage("Bg2.png");
    
  }
  
  void display(){
    imageMode(CORNER);
    image(bg1, pos1X, 0);
    image(bg2, pos2X, 0);
      
    pos1X -= speed;
    pos2X -= speed;
    
    if(pos1X<=-1400)
      pos1X = 0;
    if(pos2X<=-1400)
      pos2X = 0;
  }
}