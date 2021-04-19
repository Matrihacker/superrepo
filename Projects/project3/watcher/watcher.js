let baseURL="https://api.particle.io/v1/devices/e00fce68c1941fe24869b32b/";
let token="?access_token=52247cb3e1ee86b7ebd698fed38a8e5f7d35ad64";
//let dataURL="events";

let para1="pot1";
//let para2="pot2";
//let para3="pot3";

let data_temp=baseURL+para1+token;
let data_moi=baseURL+para2+token;
let data_lit=baseURL+para3+token;
let temp=0;
let moi=0;
let lit=0;

let currentFactor, prevFactor;
let whichParam = 1;

function setup() {
  createCanvas(400, 400);
  currentFactor = 0;
  prevFactor = 0;
}

function draw() {
  loadJSON(data_temp,dataHandle);
  
  
  currentFactor = millis() % timeInterval;
            if(currentFactor < prevFactor){ //passed an interval
                if(whichParam == 1){
                    loadJSON(data1URL, dataHandle);
                }
                
                whichParam++;
                if(whichParam == (numberOfParams+1)){
                  whichParam = 1;
            }

            prevFactor = currentFactor; // prep for the next frame
            }
  
  background(220);
  
  fill(255,0,0);
  //textSize(32);
  //text('Temperature: '+temp, width/2-100, height/2);
  
  delay(1000);
  
}

function dataHandle(JSONdata){
  console.log(JSONdata);
  if(JSONdata.name==="pot1"){
    temp=map(parseInt(JSONdata.result),0,4096,0,100);
  }
  console.log(temp);
}
