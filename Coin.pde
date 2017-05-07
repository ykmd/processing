class Coin extends Block {
  PImage coin;
  float xspeed;

  Coin(int tempCxpos, int tempCypos, float tempXspeed) {
    super(tempCxpos, tempCypos, 100, 100);
    xspeed = tempXspeed;
    coin = loadImage("coin.png");
    transpass = true;
  }

  void display() {
    image(coin, pos.x, pos.y, width, height);
  }

  void move() {
    pos.x -= xspeed;
  }
}
