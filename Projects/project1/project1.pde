
int cellSize=4;

int plantsDensity=300;
int pradatorDensity=1;

int pradatorLife=300;

int plantsGrowRate= 12;



ArrayList<Hunter> hunters = new ArrayList<Hunter>();
ArrayList<Plant> plants = new ArrayList<Plant>();


void setup(){
  size (1920,1080);
  
  for (int i =0; i<plantsDensity ;i++){
    plants.add(new Plant(width/2,height/2,width,height));
  }
  for (int i =0; i<pradatorDensity ;i++){
    hunters.add(new Hunter(width/2,height/2,width,height,pradatorLife));
  }

}


void draw(){
  
  mtblm();
  renderEngine();
  println();
}

void mousePressed() {
  
  if (mouseButton == LEFT) {
    hunters.add(new Hunter(mouseX,mouseY,0,0,pradatorLife));
  }
  if (mouseButton == RIGHT) {
    plants.add(new Plant(mouseX,mouseY,0,0));
  }
}

void mtblm(){

  for (int i = hunters.size()-1;i>=0;i--){
    hunters.get(i).startHunting(plants);
    //if(hunters.get(i).killerHandle!=-1){
    //  plants.remove(hunters.get(i).killerHandle);
    //  hunters.get(i).killerHandle=-1;
    //  hunters.get(i).bliss-=5;
      
    //}
    if(hunters.get(i).bliss <=0){
      hunters.get(i).bliss=30;
      hunters.add(new Hunter(hunters.get(i).x,hunters.get(i).y,200,200,pradatorLife));
    }

    if(hunters.get(i).life <=0){
      plants.add(new Plant(hunters.get(i).x,hunters.get(i).y,0,0));
      hunters.remove(i);
    }
  }
  
  for (int i = plants.size()-1;i>=0;i--){

      plants.get(i).grow();
      if(plants.get(i).seed<=0){
        for(int x=0; x<=plantsGrowRate;x++){
          plants.add(new Plant(plants.get(i).x,plants.get(i).y,140,140));
        }
        plants.get(i).seed=4000;

      }
   
  }
  

}

void renderEngine(){
  background(0);
  for(Plant plant:plants){
      fill(0, 255, 0);
      circle(plant.x,plant.y,cellSize);
  }
  for(Hunter hunter:hunters){
      fill(255, 0, 0);
      circle(hunter.x,hunter.y,cellSize);
  }
  
}
