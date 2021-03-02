import processing.serial.*;
import processing.sound.*;

Serial myConn;
Sound s;
SinOsc sine;

float distance=0;
float windowAdjustCoord=30;

float x=0;
float y=0;
float xp=0;
float yp=0;

void setup(){
  size(800,600);
  
  printArray(Serial.list());
  
  myConn = new Serial(this, Serial.list()[1] ,9600);
  
  myConn.bufferUntil('\n');
  background(0,0,0);
  sine = new SinOsc(this);
  sine.play();
}

void draw(){
  
  fill(0,255,0);
  stroke(0,255,0);
  

  
  
  
  windowAdjustCoord=height-(distance*(height/30))+80;
  y=windowAdjustCoord;
  //circle(x,windowAdjustCoord,5);
  line(xp, yp, x, y);
  
  xp=x;
  yp=windowAdjustCoord;
  
  x++;
  
  if(x==width){
    x=0;
    xp=0;
    background(0,0,0);
  }
  
  float freq = map(distance*50000, 0, 1000, 1.0, 0.0);
  sine.freq(freq);

  
  //delay(10);
}

void serialEvent(Serial conn){
  String fromSerial=conn.readString();
  distance = float(fromSerial);
  
  println( distance);
  

}
