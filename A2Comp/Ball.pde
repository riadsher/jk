class Ball {
  PVector pos;
  PVector vel;
  PVector accel;
  float radius;
  float cLeft, cRight, cTop, cBot;
  Ball(float posX, float posY, float velX, float velY, float accelX, float accelY, float radius) {
    pos= new PVector (posX, posY);
    vel= new PVector (velX, velY);
    accel= new PVector (accelX, accelY);
    this.radius=radius;
  }

  void wallCollision() {
    //  check if the circle hit the walls and change velocity if so
    //hits right wall
    if (width<pos.x+radius)
      vel.x=abs(vel.x)*-1;     
    //hits left wall
    else if (pos.x-radius<0)
      vel.x=abs(vel.x);
    //hits bot
    else if (height<pos.y+radius)
      vel.y=abs(vel.y)*-1;
    //hits top
    else if (pos.y-radius<0)
      vel.y=abs(vel.y);
  }

  void batCollision() {
    //circle hits top right corner of bat
    if (sq(bat.bit("batRight")+3-pos.x)+sq(bat.bit("batTop")-3-pos.y)<=sq(radius)) {
      vel.x=abs(vel.x);
      vel.y=abs(vel.y)*-1;
    }
    //circle hits top left corner of bat    
    else if (sq(bat.bit("batLeft")-3-pos.x)+sq(bat.bit("batTop")-3-pos.y)<=sq(radius)) {
      vel.x=abs(vel.x)*-1;
      vel.y=abs(vel.y)*-1;
    }

    //circle hits bottom left corner of bat
    else if (sq(bat.bit("batLeft")-3-pos.x)+sq(bat.bit("batBot")+3-pos.y)<=sq(radius)) {      
      vel.x=abs(vel.x)*-1;
      vel.y=abs(vel.y);
    }

    //circle hits bottom right corner of bat
    else if (sq(bat.bit("batRight")+3-pos.x)+sq(bat.bit("batBot")+3-pos.y)<=sq(radius)) {
      vel.x=abs(vel.x);
      vel.y=abs(vel.y);
    }

    //circle right hits bat left
    else if (bat.bit("batLeft")<cRight&& cRight<bat.bit("batLeft")+20&&cTop<bat.bit("batBot")&&cBot>bat.bit("batTop"))
      vel.x=abs(vel.x)*-1;     

    //circle left hits bat right
    else if (cLeft<bat.bit("batRight")&&bat.bit("batRight")<cLeft-20&&cTop<bat.bit("batBot")&&cBot>bat.bit("batTop"))
      vel.x=abs(vel.x);

    //  //circle bot hits bat top
    else if (bat.bit("batTop")<cBot&&cBot<bat.bit("batTop")+25&&cRight>bat.bit("batLeft")&&cLeft<bat.bit("batRight"))
      vel.y=abs(vel.y)*-1;

    //  //circle top hits bat bot
    else if (cTop<bat.bit("batBot")&&bat.bit("batBot")<cTop+25&&cRight>bat.bit("batLeft")&&cLeft<bat.bit("batRight"))
      vel.y=abs(vel.y);
  }

  void brickCollision() {
    for (Brick b : bricks) {       
        //circle hits top right corner of brick
    if (sq(b.bit("brickRight")+3-pos.x)+sq(b.bit("brickTop")-3-pos.y)<=sq(radius)) {
      vel.x=abs(vel.x);
      vel.y=abs(vel.y)*-1;
      b.hit();
    }
    //circle hits top left corner of brick    
    else if (sq(b.bit("brickLeft")-3-pos.x)+sq(b.bit("brickTop")-3-pos.y)<=sq(radius)) {
      vel.x=abs(vel.x)*-1;
      vel.y=abs(vel.y)*-1;
      b.hit();
    }

    //circle hits bottom left corner of brick
    else if (sq(b.bit("brickLeft")-3-pos.x)+sq(b.bit("brickBot")+3-pos.y)<=sq(radius)) {      
      vel.x=abs(vel.x)*-1;
      vel.y=abs(vel.y);
      b.hit();
    }

    //circle hits bottom right corner of brick
    else if (sq(b.bit("brickRight")+3-pos.x)+sq(b.bit("brickBot")+3-pos.y)<=sq(radius)) {
      vel.x=abs(vel.x);
      vel.y=abs(vel.y);
      b.hit();
    }
      //circle right hits brick left
      else if (b.bit("brickLeft")<cRight&& cRight<b.bit("brickLeft")+20&&cTop<b.bit("brickBot")&&cBot>b.bit("brickTop")) {
        vel.x=abs(vel.x)*-1;
        b.hit();
      }
      //circle left hits brick right
      else if (cLeft<b.bit("brickRight")&&b.bit("brickRight")<cLeft-20&&cTop<b.bit("brickBot")&&cBot>b.bit("brickTop")) {
        vel.x=abs(vel.x);
        b.hit();
      }
      //circle bot hits brick top
      else if (b.bit("brickTop")<cBot&&cBot<b.bit("brickTop")+25&&cRight>b.bit("brickLeft")&&cLeft<b.bit("brickRight")) {
        vel.y=abs(vel.y)*-1;
        b.hit();
      }
      //circle top hits brick bot
      else if (cTop<b.bit("brickBot")&&b.bit("brickBot")<cTop+25&&cRight>b.bit("brickLeft")&&cLeft<b.bit("brickRight")) {
        vel.y=abs(vel.y);
        b.hit();
      }
    }
  }

  void update() {   
    pos.add(vel);
    vel.y+=(accel.y);
    pos.add(vel);
    cLeft=pos.x-radius;
    cRight=pos.x+radius;
    cTop=pos.y-radius;
    cBot=pos.y+radius;
  }
  void drawBall() {
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
}