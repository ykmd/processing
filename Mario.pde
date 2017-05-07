class Mario {
  PImage mario, marioJump;
  Position pos = new Position(20, 660);
  int w = 150, h = 100;
  boolean isJumping = false;
  boolean isFalling = false;
  boolean canJump = true;
  int jumpHeight = 0;
  int initialJumpLimit = 400;
  int jumpLimit = initialJumpLimit;
  boolean blockTop = false;
  boolean blockBottom = false;
  boolean blockLeft = false;
  boolean blockRight = false;

  Mario() {
    mario = loadImage("Mario.png");
    marioJump = loadImage("MarioJump.png");
  }

  void display() {
    imageMode(CENTER);
    image(mario, pos.x, pos.y, w, h);

    if (pos.y < 660 && !blockBottom && !isJumping) {
        jumpHeight = 660 - pos.y;
        stopJumping();
    }

    if (isJumping == true) {
      jumps();
      image(marioJump, pos.x, pos.y, w, h);
      if (jumpHeight > jumpLimit) {
        stopJumping();
      }
    }

    if (isFalling == true) {
      falls();
      if (jumpHeight <= 0) {
        isFalling = false;
        canJump = true;
      }
    }

    if (pos.x < 0)
      pos.x = 0;
    if (pos.x > width)
      pos.x = width;
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT && !blockLeft) {
        pos.x+=50;
      } else if (keyCode == LEFT && !blockRight) {
        pos.x-=50;
      } else if (keyCode == UP && canJump == true) {
        isJumping = true;
        canJump = false;
      }
    }
  }

  boolean isInbound(int posX, int posY) { //to check if one corner of the object is inside Mario
    return (posX > pos.x) && (posX < pos.x + w) && (posY > pos.y) && (posY < pos.y + h);
  }

  boolean isColliding(Block item) { //calls it four times to check all four corners -> if any corner of the object is inside Mario = they are colliding
    return isInbound(item.pos.x, item.pos.y) || isInbound(item.pos.x + item.width, item.pos.y)
      || isInbound(item.pos.x, item.pos.y + item.height) || isInbound(item.pos.x + item.width, item.pos.y + item.height);
  }


  boolean isBetween(int target, int lowEnd, int highEnd) {
    return (lowEnd <= target) && (target <= highEnd); //if target >= lowEnd && <= highEnd = target is between lowEnd and hignEnd
  }

  boolean isLessThan(int lowPoint, int highPoint, int end) {
    return (lowPoint < end) && (highPoint < end);
  }

  boolean isMoreThan(int lowPoint, int highPoint, int end) {
    return (lowPoint > end) && (highPoint > end);
  }

  boolean isOn(String direction, Block item) { //to check if Mario is touching the box from that direction
    if (direction == "LEFT") {
      return (isBetween(pos.y, item.pos.y, item.pos.y + item.height) //the y position of Mario is between the y position of the object
        || isBetween(pos.y + h, item.pos.y, item.pos.y + item.height))
        && isLessThan(pos.x, pos.x + w, item.pos.x + item.width); //the x position of the object > Mario (x+width) = Mario will be on the left hand side of the object
    } else if (direction == "RIGHT") {
      return (isBetween(pos.y, item.pos.y, item.pos.y + item.height)
        || isBetween(pos.y + h, item.pos.y, item.pos.y + item.height))
        && isMoreThan(pos.x, pos.x + w, item.pos.x);
    } else if (direction == "TOP") {
      return (isBetween(pos.x, item.pos.x, item.pos.x + item.width)
        || isBetween(pos.x + w, item.pos.x, item.pos.x + item.width))
        && isLessThan(pos.y, pos.y + h, item.pos.y + h);
    } else if (direction == "BOTTOM") {
      return (isBetween(pos.x, item.pos.x, item.pos.x + item.width)
        || isBetween(pos.x + w, item.pos.x, item.pos.x + item.width))
        && isMoreThan(pos.y, pos.y + h, item.pos.y);
    }
    return false;
  }

  void blockReset() {
    blockTop = false;
    blockBottom = false;
    blockLeft = false;
    blockRight = false;
  }

  void isBlockedBy(Block item) {
    if (isColliding(item) && !item.transpass) {
      if (isOn("BOTTOM", item)) {
        blockTop = true;
        stopJumping();
      } else if (isOn("TOP", item)) {
        blockBottom = true;
        pos.y -= 10;
        jumpHeight = 0;
        isFalling = false;
        canJump = true;
      } else if (isOn("LEFT", item)) {
        blockLeft = true;
        pos.x -= 1;
      } else if (isOn("RIGHT", item)) {
        blockRight = true;
        pos.x += 1;
      }
    }
  }

  boolean coinsGet(ArrayList<Coin> coins, int index) {
    if (isColliding(coins.get(index))) {
        coins.remove(index);
        return true;
    }
    return false;
  }

  void stopJumping() {
    isJumping = false;
    isFalling = true;
  }

  void jumps() {
    pos.y -= 10;
    jumpHeight += 10;
  }

  void falls() {
    pos.y += 10;
    jumpHeight -= 10;
  }
}
