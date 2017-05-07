class Bricks extends Block {
  PImage bricks;
  float xspeed;
  
  Bricks(int tempBxpos, int tempBypos, float tempXspeed){
    super(tempBxpos, tempBypos, 100, 100);
    xspeed = tempXspeed;
    bricks = loadImage("brick.png");
  }
  
  void display(){
     image(bricks, pos.x, pos.y, width, height);
  }
  
  void move(){
    pos.x -= xspeed;
  }
}