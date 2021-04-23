let circText;
let temp=0;
let moi=0;
let lit=0;

function setup() {
  createCanvas(windowWidth, windowHeight);
  
  //circText = new drawText("SAFE ZONE", 100, 1);
  
  textFont('Helvetica');
  textSize(12);
}

function draw() {
  
  translate(width/2,height/2);
  
  blendMode(BLEND);
  background(245);
  

  
  //noStroke();
  blendMode(MULTIPLY);
  noStroke();
  
  
  
  fill(0,150,240);
  drawLiq(18,50,20,100,temp);
  fill(240,240,0);
  drawLiq(15,60,25,120,moi);
  fill(240,0,240);
  drawLiq(12,45,15,150,lit);
  
  blendMode(EXCLUSION);
  strokeWeight(2);
  
  noFill();
  stroke(255, 41, 25);
  circle(0,0,900);
  circle(0,0,500);
  stroke(230, 20, 230);
  circle(0,0,700);



  
}


function drawLiq(vNnum,nm,sm,fcm,rofst){
  push();
  rotate(frameCount/fcm);
  let dr = TWO_PI/vNnum;
  beginShape();
  for(let i = 0; i  < vNnum + 3; i++){
    let ind = i%vNnum;
    let rad = dr *ind;
    let r = height*0.3 + noise(frameCount/nm + ind) * height*0.1 + sin(frameCount/sm + ind)*height*0.05+rofst;
    curveVertex(cos(rad)*r, sin(rad)*r);
  }
  endShape();
  pop();
}


//function drawText(textToWrite, rad, neg) {
////  let screenPct = min(height, width) / 2000;
//  this.radius = rad;
//  this.neg = neg;
  
//  this.pointForIndex = function(pct) {
//  //  const NOISE_SCALE       = 1.5;
//    let angle = pct * TWO_PI;
//    let cosAngle = cos(angle);
//    let sinAngle = sin(angle);
//    // let time = frameCount / 1000;
//    // let noiseValue = noise(NOISE_SCALE * cosAngle + NOISE_SCALE, NOISE_SCALE * sinAngle + NOISE_SCALE, time);
//    // let radius = rad;
//    return {
//      x: this.radius * cosAngle + centerX,
//      y: this.radius * sinAngle + centerY
//    };
//  }

//  this.drawTextCircle = function(){

//    //draw text
//  //  let pct = atan2(mouseY - centerY, mouseX - centerX) / TWO_PI;//follow mouse
//    let pct = atan2(mouseY-centerY , mouseX-centerX ) / (this.neg*TWO_PI);//follow mouse
//    //let pct = 0;//dont follow mouse
//    let pixToAngularPct = 1/((this.radius)*TWO_PI);
//    for (var i = 0; i < textToWrite.length; i++) {
//      let charWidth = textWidth(textToWrite.charAt(i));
//      pct += charWidth/2 * pixToAngularPct;

//      //calculate angle
//      let leftP = this.pointForIndex(pct-0.01);
//      let rightP = this.pointForIndex(pct+0.01);
//      let angle = atan2(leftP.y - rightP.y, leftP.x - rightP.x) + PI;

//      push();
//        fill(255);
//        let p = this.pointForIndex(pct);
//        //apply angle
//        translate(p.x, p.y);
//          rotate(angle);
//        translate(-p.x, -p.y);
//        text(textToWrite.charAt(i), p.x-charWidth/2, p.y);
//      pop();

//      pct += charWidth/2 * pixToAngularPct;
//    }//for
//  }
  
//  this.drawShape = function(weight, color){
//      //draw sphere
//    //  fill(0);
//    push();
//    //noFill();
//  //noStroke();
//    fill(0, 155, 255);
//    strokeWeight(weight);
//    stroke(0, 155, 255);
//  beginShape();
//    for (let i = 0; i < SEGMENTS; i++) {
//      let p0 = this.pointForIndex(i/SEGMENTS);
//      vertex(p0.x, p0.y);
//    }
//  endShape(CLOSE);
//  //  ellipse(centerX, centerY, this.radius);
//  pop();
//  }
//}
