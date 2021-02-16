class Ball{
  float posX,posY;
  float velX,velY;
  
  float radius;
  color bCol;
  boolean bStroke;
  
  Ball(float _mposx,float _mposy){
    posX =_mposx;
    posY=_mposy;
    
    velX=random(-4,4);
    velY=random(-4,4);
    
    radius = random(60,120);
    
    bCol = color(random(255),random(255),random(255));
    
    bStroke=false;
  }
  
  void display(){
    fill(bCol);
    if(!bStroke){
      noStroke();
    }
    circle(posX,posY,radius*2);
  }
  
  void move(){
    if(posX>= width - radius||posX<=radius){
      velX*=-1;
    }
    if(posY>= height - radius||posY<=radius){
      velY*=-1;
    }
    posX += velX;
    posY += velY;
    
  }
}
