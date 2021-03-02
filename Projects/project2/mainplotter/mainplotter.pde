import grafica.*;

import processing.serial.*;

Serial myConn;

float distance=0;
float windowAdjustCoord=30;

void setup(){
  size(800,600);
  
  printArray(Serial.list());
  
  myConn = new Serial(this, Serial.list()[1] ,9600);
  
  myConn.bufferUntil('\n');
  
  GPlot plot=new GPlot(this,25, 25);
  
}

void draw(){
  background(255);
  fill(255,0,0);
  windowAdjustCoord=height-(distance*(height/30))+20;
  circle(width/2,windowAdjustCoord,20);

}

void serialEvent(Serial conn){
  String fromSerial=conn.readString();
  distance = float(fromSerial);
  
  println( distance);
  
}

void plotter(float point){
  
}
