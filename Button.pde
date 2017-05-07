class Button {
  int posX, posY, w, h;
  //PFont myFont = createFont("Times", 14);
  boolean clicked;
  
  void update() {
    if (mouseX>=posX-w/2&&mouseX<=posX+w/2 && mouseY>=posY-h/2 && mouseY<=posY+h/2) {
      if (mousePressed==true){
        clicked=true;
      }
    }
  }
  
  void display(int x, int y, int bw, int bh, String label) {
    noStroke();
    fill(255, 255, 255, 100);
    rectMode(CENTER);
    rect(x, y, bw, bh);
    fill(255);
    //textFont(myFont);
    textAlign(CENTER, CENTER);
    text(label, x, y);
    posX=x; 
    posY=y; 
    w=bw; 
    h=bh;
  }
  
  void create(int x, int y, int bw, int bh, String label) {
    this.display(x, y, bw, bh, label);
    this.update();
  }
}
  