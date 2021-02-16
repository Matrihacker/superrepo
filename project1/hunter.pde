class Hunter{
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
  ArrayList<Plant> entitielist;

  float distCache;

  
  Hunter(float mdpX,float mdpY,float rangeX,float rangeY, int lifei){
    x=int(random(mdpX-rangeX/2,mdpX+rangeX/2));
    y=int(random(mdpY-rangeY/2,mdpY+rangeY/2));
    speed=1;
    bliss=30;
    life=lifei;
  }
  
  void startHunting(ArrayList<Plant> entities){
    
    i=0;
    handle=0;
    distCache=9999;
    for(Plant f:entities){
      
      if((f.x!=x)&&(f.y!=y)&&(f.state==0)){
        
        if(distCache >= dist(x,y,f.x,f.y)){
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
    for(int i = entities.size()-1;i>=0;i--){
      if((entities.get(i).x!=x)&&(entities.get(i).y!=y)){
        if(dist(x,y,entities.get(i).x,entities.get(i).y)<=cellSize*2){
          killerHandle=handle;
          entities.remove(killerHandle);
          bliss-=5;
          break;
        }
      }
    }
    
  }
  
  
  
}
