class Ball{
  float posX,posY;
  float velX,velY;
  
  float radius;

  color bCol;
  boolean bStroke;
  
  Ball(float _mposx,float _mposy){
    posX =_mposx;
    posY=_mposy;
    
    velX=random(-9,9);
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
    if(posY<=radius){
      velY=0;
    }
    else{
      velY-=0.06;
    }
    if(posY>= height - radius){
      velY*=-1;
    }
    if(velY>0){
      velY-=1;
    }
    
    velX=velX/1.04;
    
    
    posX += velX;
    posY += velY;
    
    println(velX,velY);
  }
}
