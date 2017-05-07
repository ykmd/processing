class QBricks extends Block {
  PImage qbricks;
  float xspeed;
  
  QBricks(int tempQBxpos, int tempQBypos, float tempXspeed){
    super(tempQBxpos, tempQBypos, 100, 100);
    xspeed = tempXspeed;
    qbricks = loadImage("qbrick.png");
  }
  
  void display(){
     image(qbricks, pos.x, pos.y, width, height);
  }
  
  void move(){
    pos.x -= xspeed;
  }
}