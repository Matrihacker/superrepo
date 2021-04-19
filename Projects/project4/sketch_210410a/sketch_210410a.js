let _divideNum;
let _noiseStep;
let _objectNum;
let _aryObjects = [];
let _noiseSeedRad;
let _noiseSeedAng;
let _noiseStepRad;
let _noiseStepAng;
let _noiseSpeedRad;
let _noiseSpeedAng;
let _rad;
let _scale;
let _rad_offset;
let _noiseSeedT;
let _noiseStepT;
let _initColor;
let _objStep;
let lapse = 0;    // mouse timer
let people = [];
let sleepLeftMilliseconds=0;
let updateHandle=0;
function setup() {
  let canvasSize;
  if (windowWidth <= windowHeight) {
    canvasSize = windowWidth;
  } else {
    canvasSize = windowHeight;
  }
  createCanvas(1112, 834);
  colorMode(HSB,360, 100, 100, 255);
  frameRate(30);
  noStroke();
  _divideNum = 12;
  _objectNum =6;
  _noiseSeedRad = random(10);
  _noiseSeedAng = random(10);
  _noiseStepRad = 0.2;
  _noiseStepAng = 0.01;
  _noiseSpeedRad = 0.000;
  _noiseSpeedAng = 0.005;
  _noiseStepObj = 0.08;
  _rad = width/2;
  _scale = 4;
  _rad_offset = 0;
  _noiseSeedT = random(10);
  _noiseStepT = 0.015;
  _initColor = random(720);
  _objStep = 0;
  people = [5,2,1,5,3,7,4,2,9,1,4,7];
}

function Circle(people) {
  
  //fill((-200/objectNum*i + 720 +_initColor)%360, 100, 100, 255);
  
  drawingContext.shadowBlur = width/8;
  drawingContext.shadowColor = color(0);
  for (let i = 0; i <= 11; i++) {
    
    
    let number_people=people[i];
    
    for (x =number_people; x>=0;x--){
      fill(x*10,100,100,255)
      
      arc(0, 0, x*100, x*100, i*(PI/6), i*(PI/6)+(PI/6));
    }
    
  }
}

function draw() {
  
      
      sleepLeftMilliseconds -= deltaTime;
      if (sleepLeftMilliseconds <= 0) { 
        sleepLeftMilliseconds=1000;
        if(updateHandle>11){
          updateHandle=0;
        }
        else{
          updateHandle++;
        }
        people[update_handle]=random(10);
        background(0);
        push();
        translate(width/2, height/2);
        Circle(people);
        pop();
        
    }
  
  
  
}
