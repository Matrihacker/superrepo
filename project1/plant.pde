class Plant{
  float x;
  float y;
  int state;
  int replicator;
  int life;
  int bliss;
  int seed;
  int handle;
  int killerHandle;
  float rad;
  float speed;
  int i;
  float distCache;

  
  Plant(float mdpX,float mdpY,float rangeX,float rangeY){
    x=int(random(mdpX-rangeX/2,mdpX+rangeX/2));
    y=int(random(mdpY-rangeY/2,mdpY+rangeY/2));
    speed=1;
    bliss=30;
    seed=int(random(500,12000));
    
  }
  
  
  void grow(){
    seed-=2;
  }
  
  

  
}
