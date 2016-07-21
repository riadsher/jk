void setup(){
  size(400,400);  
  rectMode(CENTER); //draws the rect around the mouse
 
}
//velocity, size, and initial position of the circle
PVector  vc = new PVector(4,4);
int size=40;
PVector cPos=new PVector(0+size,0+size);
int radius=size/2;
//size of bat
int batWide=60;
int batHigh=50;


void draw(){
  background(0);
  fill(255);
  ellipse(cPos.x,cPos.y,size,size);
  //move the circle based on the velocity
  cPos.x+=vc.x;
  cPos.y+=vc.y;
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
  if(cPos.x+radius>width||cPos.x-radius<0)
    vc.x*=-1; 
  else if(cPos.y+radius>height||cPos.y-radius<0)
    vc.y*=-1;
    //circle right hits bat left
    
    //circle hits top right corner of bat
  if(batRight-10>cLeft&&batTop+10<cBot&&batRight<cLeft+4&&batTop>cBot-4){
     vc.x=abs(vc.x);
     vc.y=abs(vc.y)*-1;}
  else if(cRight>batLeft&& cRight<batLeft+4&&cTop<batBot&&cBot>batTop)
     vc.x=abs(vc.x)*-1;
    //circle left hits bat right
  else if(cLeft<batRight&&cLeft>batRight-4&&cTop<batBot&&cBot>batTop)
     vc.x=abs(vc.x);
    //circle bot hits bat top
  else if(cBot>batTop&&cBot<batTop+4&&cRight>batLeft&&cLeft<batRight)
      vc.y=abs(vc.y)*-1;
    //circle top hits bat bot
  else if(cTop<batBot&&cTop>batBot-4&&cRight>batLeft&&cLeft<batRight)
     vc.y=abs(vc.y);
    
   
  

  
 
  
  
}