void setup(){
  size(600,400);  
  rectMode(CENTER); //draws the rect around the mouse
 
}
//velocity, size, and initial position of the circle
PVector  vc = new PVector(1,1);
int size=40;
PVector cPos=new PVector(0+size,0+size);
PVector cAccel=new PVector(0,.25);
int radius=size/2;
//size of bat
int batWide=60;
int batHigh=50;


void draw(){
  background(0);
  fill(255,0,0);
  //move the circle based on the velocity
  cPos.add((vc));
  vc.add(cAccel);
  cPos.add((vc));
  ellipse(cPos.x,cPos.y,size,size);
  
  //bounds and position of the bat, based on mouse position
  float batX=mouseX;
  float batY=mouseY;  
  float batLeft=batX-batWide/2;
  float batRight=batX+batWide/2;
  float batTop=batY-batHigh/2;
  float batBot=batY+batHigh/2;
  //bounds of the circle
  float cLeft=cPos.x-radius;
  float cRight=cPos.x+radius;
  float cTop=cPos.y-radius;
  float cBot=cPos.y+radius;
  //draw the rectangle on mouse position
  rect(batX,batY,batWide,batHigh);
  //check if the circle hit the walls and change velocity if so
  //hits left wall
  if(width<cPos.x+radius)
    vc.x=abs(vc.x)*-1;
    //hits right wall
  else if(cPos.x-radius<0)
    vc.x=abs(vc.x);
    //hits top
  else if(height<cPos.y+radius)
    vc.y=abs(vc.y)*-1;
    //hits bot
  else if(cPos.y-radius<0)
    vc.y=abs(vc.y);
    
     
    //circle hits top right corner of bat
  if(sq(batRight+3-cPos.x)+sq(batTop-3-cPos.y)<=sq(radius)){
     vc.x=abs(vc.x);
     vc.y=abs(vc.y)*-1;
     println("It worked");
     draw();
    }
     //circle right hits bat left
  else if(batLeft<cRight&& cRight<batLeft+20&&cTop<batBot&&cBot>batTop)
     vc.x=abs(vc.x)*-1;
  
     
    //circle left hits bat right
  else if(cLeft<batRight&&batRight<cLeft-20&&cTop<batBot&&cBot>batTop)
     vc.x=abs(vc.x);
    
    //circle bot hits bat top
  else if(batTop<cBot&&cBot<batTop+25&&cRight>batLeft&&cLeft<batRight)
      vc.y=abs(vc.y)*-1;
      
    //circle top hits bat bot
  else if(cTop<batBot&&batBot<cTop+25&&cRight>batLeft&&cLeft<batRight)
     vc.y=abs(vc.y);  
   
     
     
}