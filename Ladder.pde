class Ladder extends Block {
  PImage ladder;
  float xspeed;
  
  Ladder(int tempLxpos, int tempLypos, float tempXspeed){
    super(tempLxpos, tempLypos, 100, 100); //to initialize with the Block class constructor
    xspeed = tempXspeed;
    ladder = loadImage("ladder.png");
  }
  
  void display(){
    image(ladder, pos.x, pos.y, width, height);
  }
  
  void move(){
    pos.x -= xspeed;
  }
}