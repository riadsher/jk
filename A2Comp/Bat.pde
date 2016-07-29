public class Bat {
  int wide, high, x, y;
  Bat(int wide, int high, int x, int y) {
    this.wide=wide;
    this.high=high;
    this.x=x;
    this.y=y;
  }

  void update() {
    this.x=mouseX;
    this.y=mouseY;
  }

  int bit(String part) {    
    switch(part) {
    case "batLeft":
      return x-wide/2;
    case "batRight": 
      return x+wide/2;
    case "batTop": 
      return y-high/2;
    case "batBot": 
      return y+high/2;  
    default: 
      return -1;
    }
  }
  void drawBat() {
    rectMode(CENTER);
    fill(0, 0, 255);
    rect(x, y, wide, high);
  }
}