class Entity{
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
  ArrayList<Entity> entitielist;
  float distCache;

  
  Entity(float mdpX,float mdpY,float rangeX,float rangeY, int statei){
    x=int(random(mdpX-rangeX/2,mdpX+rangeX/2));
    y=int(random(mdpY-rangeY/2,mdpY+rangeY/2));
    state=statei;
    speed=1;
    bliss=30;
    life=500;
    seed=int(random(500,12000));
  
  }
  
  
  void grow(){
    seed-=2;
  }
  
  void startHunting(ArrayList<Entity> entities){
    
    i=0;
    handle=0;
    distCache=9999;
    for(Entity f:entities){
      
      if((f.x!=x)&&(f.y!=y)&&(f.state==0)){
        
        if(distCache > dist(x,y,f.x,f.y)){
          distCache=dist(x,y,f.x,f.y);
          handle=i;
          
        }
      }
      i++;
    }
    
    rad=atan2((entities.get(handle).y-y),(entities.get(handle).x-x));
    
    x+=cos(rad)*speed;
    y+=sin(rad)*speed;
    
    life--;
    
    
    killerHandle=-1;
    for(Entity f:entities){
      if((f.x!=x)&&(f.y!=y)&&(f.state==0)){
        if(dist(x,y,f.x,f.y)<=cellSize*2){
          killerHandle=handle;
          bliss-=5;
          
        }
      }
    }
    
  }
  

  
}
