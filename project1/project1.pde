
int cellSize=4;

int plantsDensity=128;
int pradatorDensity=1;

ArrayList<Entity> entities = new ArrayList<Entity>();

void setup(){
  size (1920,1080);
  
  for (int i =0; i<plantsDensity ;i++){
    entities.add(new Entity(width,height,0));
  }
  for (int i =0; i<pradatorDensity ;i++){
    entities.add(new Entity(width,height,1));
    
  }

}


void draw(){
  background(0);
  for (Entity entity:entities){
    entity.startHunting(entities);
    if(entity.state==1){
      println(entity.x,entity.y,entity.k,entity.handle);
    }
    
  }
  renderEngine();

}

void renderEngine(){
  for(Entity entity:entities){
    if (entity.state==0){
      fill(0, 255, 0);
      circle(entity.x,entity.y,cellSize);
    }
    else if(entity.state==1){
      fill(255, 0, 0);
      circle(entity.x,entity.y,cellSize);
    }
  }
}
