class Entity{
  float x;
  float y;
  int state;
  int replicator;
  int life;
  int handle;
  float k;
  float speed;
  int i;
  ArrayList<Entity> entitielist;

  
  Entity(int bitmapSizeX,int bitmapSizeY, int statei){
    x=int(random(0,bitmapSizeX));
    y=int(random(0,bitmapSizeY));
    state=statei;
    speed=0.001;

  
  }
              

  void startHunting(ArrayList<Entity> entities){
    float distCache;
    i=0;
    handle=0;
    distCache=9999999;
    for(Entity entity:entities){
      if((entity.x!=x)&&(entity.y!=y)){
        if(distCache < dist(x,y,entity.x,entity.y)){
          distCache=dist(x,y,entity.x,entity.y;
          handle=i;
        }
      }
      i++;
    }
    
    k=(y-entities.get(handle).y)/(x-entities.get(handle).x);
    
    x+=speed;
    y=k*x;
    
    
    for(Entity entity:entities){
      if(dist(x,y,entity.x,entity.y)<=cellSize*2){
        entities.remove(handle);
      }
    }
    
  }
  
}
