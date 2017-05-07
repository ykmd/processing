import processing.video.*;

PImage banner, coinImage;
Movie movie;
Button start, howtoplay;

Bg bg;
Mario mario;
Bricks[] bricks;
QBricks[] qbricks;
ArrayList<Coin> coins;
Tubes[] tubes;
Ladder[] ladder;
Mushroom mushroom1, mushroom2, mushroom3;

int mode = 0;
int marks;
int coinsGet;
int startTime, timeLeft, timeLimit = 60000;

void setup() {
  size(1400, 800);
  bg = new Bg();
  banner = loadImage("banner.png");
  coinImage = loadImage("coin.png");
  movie = new Movie(this, "mario.mov");
  start = new Button();
  howtoplay = new Button();
  mario = new Mario();
  bricks = new Bricks[8];
  for (int i=0; i<8; i++) {
    int[] tempBxpos = {1000, 1200, 1600, 1700, 1800, 1900, 2000, 3700};
    bricks[i] = new Bricks(tempBxpos[i], 400, 1);
  }
  qbricks = new QBricks[5];
  for (int i=0; i<5; i++) {
    int[] tempQBxpos = {1100, 1800, 3500, 3700, 3900};
    int[] tempQBypos = {400, 100, 250, 100, 250};
    qbricks[i] = new QBricks(tempQBxpos[i], tempQBypos[i], 1);
  }
  coins = new ArrayList<Coin>();
  for (int i=0; i<5; i++) {
    int[] tempCxpos = {1600, 1700, 1800, 1900, 2000};
    coins.add(new Coin(tempCxpos[i], 300, 1));
  }
  tubes = new Tubes[5];
  for (int i=0; i<5; i++) {
    int[] tempTxpos = {2450, 4250, 6500, 8500, 10500};
    tubes[i] = new Tubes(tempTxpos[i], 625, 1);
  }
  ladder = new Ladder[14];
  for (int i=0; i<14; i++) {
    int[] tempLxpos = {2800, 2900, 3000, 3100, 3200, 2900, 3000, 3100, 3200, 3000, 3100, 3200, 3100, 3200};
    int[] tempLypos = {660, 660, 660, 660, 660, 560, 560, 560, 560, 460, 460, 460, 360, 360};
    ladder[i] = new Ladder(tempLxpos[i], tempLypos[i], 1);
  }
  mushroom1 = new Mushroom(2300, 660, 2);
  mushroom2 = new Mushroom(3500, 660, -2);
  mushroom3 = new Mushroom(6200, 660, 2);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  background(255);
  bg.display();

  //First Screen (Menu)
  switch(mode) {
  case 0:
    if (start.clicked==false) {
      imageMode(CENTER);
      image(banner, width/2, 250);
      fill(255);
      //textFont(myFont);
      textAlign(CENTER);
      textSize(20);
      text("@1985 NIETENDO", width/2 + 200, 480);

      start.create(width/2, 550, 300, 50, "START GAME");

      howtoplay.create(width/2, 600, 300, 50, "HOW TO PLAY");
    }

    if (start.clicked==true) {
      mode=1;
    }

    if (howtoplay.clicked==true) {
      image(movie, width/2, height/2, 1400, 800);
      movie.loop();
      start.create(1250, 750, 300, 50, "START GAME");
    }

    break;

  case 1:
    timeLeft = timeLimit-(millis()-startTime);
    movie.stop();
    fill(255);
    textMode(CENTER);
    textSize(20);
    text("MARIO", 50, 30);
    text(marks, 50, 50);
    image(coinImage, 350, 30, 30, 30);
    text("x " + coinsGet, 400, 40);
    text("WORLD", 800, 30);
    text("1-1", 800, 50);
    text("TIME", 1300, 30);
    text(nf(float(timeLeft)/1000, 2, 1)+"s", 1300, 50);

    mario.display();
    mario.blockReset();

    for (int i=0; i<bricks.length; i++) {
      bricks[i].display();
      bricks[i].move();
      mario.isBlockedBy(bricks[i]);
    }
    for (int i=0; i<qbricks.length; i++) {
      qbricks[i].display();
      qbricks[i].move();
      mario.isBlockedBy(qbricks[i]);
    }
    for (int i=0; i < coins.size(); i++) {
      coins.get(i).display();
      coins.get(i).move();
      if (mario.coinsGet(coins, i)) {
        coinsGet++;
        i--;
      }
    }
    for (int i=0; i<tubes.length; i++) {
      tubes[i].display();
      tubes[i].move();
      mario.isBlockedBy(tubes[i]);
    }
    for (int i=0; i<ladder.length; i++) {
      ladder[i].display();
      ladder[i].move();
      mario.isBlockedBy(ladder[i]);
    }

    mushroom1.display();
    mushroom1.move();
    mushroom2.display();
    mushroom2.move();
    mushroom3.display();
    mushroom3.move();

    if (timeLeft <= 0) {
      timeLeft = 0;
      mode = 2;
    }

    break;

  case 2:
    fill(255);
    text("GAME OVER", width/2-30, height/2);
    text(nf(float(timeLeft)/1000, 2, 1)+"s", 1300, 50);
    break;
  }
}

void keyPressed() {
  mario.keyPressed();
  if (mode==2)
    if (key=='R'||key=='r')
      mode = 0;
}
