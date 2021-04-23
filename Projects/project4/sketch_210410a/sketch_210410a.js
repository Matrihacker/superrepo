
let people = [];
let sleepLeftMilliseconds=0;
let update=0;

function setup() {
  let canvasSize;
  //if (windowWidth <= windowHeight) {
  //  canvasSize = windowWidth;
  //} else {
  //  canvasSize = windowHeight;
  //}
  //createCanvas(1112, 834);
  createCanvas(windowWidth, windowHeight);
  let fs = fullscreen();
  fullscreen(!fs);
  
  colorMode(HSB,360, 100, 100, 255);
  frameRate(30);
  noStroke();

  people = [5,2,1,5,3,7,4,2,9,1,4,7];
}

function Circle(people) {
  
  //fill((-200/objectNum*i + 720 +_initColor)%360, 100, 100, 255);
  
  drawingContext.shadowBlur = width/8;
  drawingContext.shadowColor = color(0);
  for (let i = 0; i <= 11; i++) {
    
    
    let number_people=people[i];
    
    for (x =number_people; x>=0;x--){
      fill(x*10,100,100,255);
      
      arc(0, 0, x*100, x*100, i*(PI/6), i*(PI/6)+(PI/6));
    }
    
  }
}

function draw() {
  
      
      sleepLeftMilliseconds -= deltaTime;
      if (sleepLeftMilliseconds <= 0) { 
        sleepLeftMilliseconds=2000;
        if(update>11){
          update=0;
        }
        else{
          update++;
        }
        people[update]=random(10);
        background(0);
        push();
        translate(width/2, height/2);
        Circle(people);
        pop();
        
    }
  
  
  
}
