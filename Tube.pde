class Tubes extends Block {
  PImage tubes;
  float xspeed;
  
  Tubes(int tempTxpos, int tempTypos, float tempXspeed){
    super(tempTxpos, tempTypos, 150, 170);
    pos = new Position(tempTxpos, tempTypos);
    xspeed = tempXspeed;
    tubes = loadImage("tubes.png");
  }
  
  void display(){
    image(tubes, pos.x, pos.y, width, height);
  }
  
  void move(){
    pos.x -= xspeed;
  }
}