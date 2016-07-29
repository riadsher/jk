public class Brick {
  int left, top, wide, high;
  int status;
  //3=green, 2=yellow, 1=red, 0=smashed

  Brick (int left, int top, int wide, int high) {
    this.left=left;
    this.top=top;
    this.wide=wide;
    this.high=high;
    status=3;
  }

  int bit(String part) {    
    switch(part) {
    case "brickLeft":
      return left-wide/2;
    case "brickRight": 
      return left+wide/2;
    case "brickTop": 
      return top-high/2;
    case "brickBot": 
      return top+high/2;  
    default: 
      return -1;
    }
  }

  void hit() {
    status--;
    if (status==0) {
     left=-50;
     
    }
  }
  void drawBrick() {
    if (status== 3) 
      fill(0, 255, 0);     
    if (status== 2)
      fill(150, 150, 0);
    if (status== 1)
      fill(255, 0, 0);
    rectMode(CENTER);
    rect(left, top, wide, high);
  }

}