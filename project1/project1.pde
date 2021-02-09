
int cellSize=4;

int plantsDensity=200;
int pradatorDensity=1;

int pradatorLife=300;

int plantsGrowRate= 5;



ArrayList<Entity> entities = new ArrayList<Entity>();

void setup(){
  size (1920,1080);
  
  for (int i =0; i<plantsDensity ;i++){
    entities.add(new Entity(width/2,height/2,width,height,0,pradatorLife));
  }
  for (int i =0; i<pradatorDensity ;i++){
    entities.add(new Entity(width/2,height/2,width,height,1,pradatorLife));
    
  }

}


void draw(){
  
  mtblm();
  
  for (Entity entity:entities){
    
    if(entity.state==1){
      entity.startHunting(entities);
      //println(entity.x,entity.y,entity.rad,entity.handle,entity.distCache);
    }
    
  }
  
  
  renderEngine();

}

void mousePressed() {
  
  if (mouseButton == LEFT) {
    entities.add(new Entity(mouseX,mouseY,0,0,0,pradatorLife));
  }
  if (mouseButton == RIGHT) {
    entities.add(new Entity(mouseX,mouseY,0,0,1,pradatorLife));
  }
}

void mtblm(){
  int i;
  i=0;
  for (Entity entity:entities){
    
    if((entity.state==1)&&(entity.killerHandle!=-1)){
      entities.remove(entity.killerHandle);
      break;
    }
  }
  
  for (Entity entity:entities){
    if(entity.state==0){
      entity.grow();
      if(entity.seed<=0){
        for(int x=0; x<=plantsGrowRate;x++){
          entities.add(new Entity(entity.x,entity.y,140,140,0,pradatorLife));
        }
        entity.seed=4000;
        break;
      }
    }
  }
  
  for (Entity entity:entities){
    if(entity.state==1){
      if(entity.life <=0){
        entity.state=0;
        entity.x=random(entity.x-10,entity.x+10);
        entity.y=random(entity.y-10,entity.y+10);
        break;
      }
    }
    
  }
  for (Entity entity:entities){
    if(entity.state==1){
      
      if(entity.bliss <=0){
        entities.add(new Entity(entity.x,entity.y,200,200,1,pradatorLife));
        entity.bliss=30;
        break;
      }

    }
    
  }
}

void renderEngine(){
  background(0);
  for(Entity entity:entities){
    if (entity.state==0){
      fill(0, 255, 0);
      circle(entity.x,entity.y,cellSize);
    }
    else if(entity.state==1){
      fill(255, 0, 0);
      circle(entity.x,entity.y,cellSize*1.5);
    }
  }
}
