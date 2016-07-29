
Brick[] bricks=new Brick[15];
Ball ball;
Bat bat;
void setup() {
  size(600, 400);  
  //rectMode(CENTER); //draws the rect around the mouse
  ball= new Ball(0, 0, 1, 1, 0, .25, 20);
  bat= new Bat(60, 25, mouseX, mouseY);
 
    int i=0;
  for(int row=0;row<3;row++){
    for (int col=0;col<5;col++){
     Brick temp= new Brick(150+col*80, 20+row*40, 50, 20);
      bricks[i]=temp;
      i++;
    }
  } 
    
    
    
  
}



void draw() {
  background(0);  


  ball.update();
  ball.wallCollision();
  ball.batCollision();
  ball.brickCollision();
  bat.update();
  ball.drawBall();
  bat.drawBat();
  for (Brick b : bricks)
    b.drawBrick();










}