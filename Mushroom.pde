class Mushroom extends Block {
  PImage mushroom;
  float xspeed;
  
  Mushroom(int tempMxpos, int tempMypos, float tempXspeed){
    super(tempMxpos, tempMypos, 100, 100);
    xspeed = tempXspeed;
    mushroom = loadImage("mushroom.png");
  }
  
  void display(){
     image(mushroom, pos.x, pos.y, width, height);
  }
  
  void move(){
    pos.x -= xspeed;
  }
}