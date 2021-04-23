var boxSz = 100;
var numSpheres = 31;
var temp = [];
var moi = [];
var light = [];
let myFont;
let sleepLeftMilliseconds=0;
function preload() {
  myFont = loadFont('myFont.otf');
}

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  background(0);
//simulation data of a month
  for (var i = 0; i < numSpheres; i++) {
    temp[i] = random(20-boxSz, 180-boxSz);
    moi[i] = random(30-boxSz, 200-boxSz);
    light[i] = random(50-boxSz, 100-boxSz)
  }
// simulation for light in a day failed
//   for (var i = 0; i < numSpheres; i++) {
//     if(i>=7 & i<=12){
//       light[i] = (i-7)*(100/6)+random(-5, 5);
//     }
//     if(i>12 & i<=19){
//       light[i] = (19-(i-7)*(100/12))+random(-5, 5);
//     }
//     else{
//       light[i] =-boxSz;
//     }
    
//   }
  
  myCamera = createCamera();
  myCamera.setPosition(100, -200, 400);
  myCamera.lookAt(0, 0, 0);

}

function draw() {
  background(46, 46, 46);
  orbitControl(5, 5, 0.01);
  ambientMaterial(color("#ed6663"));
  //translate(0,0,-100);
  //rotateY(frameCount * 0.01);

  stroke(200);
  //front
  textSize(12);
  textFont(myFont);
  
  push();
  fill(255, 208, 0);
  translate(-boxSz,boxSz,boxSz+90);
  rotateY(1.5707963268);
  text("< ILLUMINATION",0,0);
  pop();
  
  push();
  fill(0, 255, 128);
  translate(-boxSz,-boxSz-70,-boxSz);
  rotateZ(1.5707963268);
  text("< MOISTURE",0,0);
  pop();
  
  push();
  fill(255, 30, 0);
  translate(boxSz+10,boxSz,-boxSz);

  text("TEMPERATURE >",0,0);
  pop();
  
  line(-boxSz, boxSz, boxSz, boxSz, boxSz, boxSz);
  line(-boxSz, -boxSz, boxSz, -boxSz, boxSz, boxSz);

  //back
  line(-boxSz, -boxSz, -boxSz, boxSz, -boxSz, -boxSz);
  line(-boxSz, boxSz, -boxSz, boxSz, boxSz, -boxSz);
  line(-boxSz, -boxSz, -boxSz, -boxSz, boxSz, -boxSz);
  line(boxSz, -boxSz, -boxSz, boxSz, boxSz, -boxSz);
  //left top
  line(-boxSz, -boxSz, boxSz, -boxSz, -boxSz, -boxSz);
  //left bottom
  line(-boxSz, boxSz, -boxSz, -boxSz, boxSz, boxSz);
  //right top

  // // right bottom
  line(boxSz, boxSz, -boxSz, boxSz, boxSz, boxSz);

  for (var i = 0; i < numSpheres; i++) {
    push();
    translate(temp[i], moi[i], light[i]);
    
    let dirY = (mouseY / height - 0.5) *2;
    let dirX = (mouseX / width - 0.5) *2;

    normalMaterial();
    sphere(boxSz / 20, 8);
    pop();
    
  }
}
