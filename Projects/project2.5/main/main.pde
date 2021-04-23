import processing.serial.*;
import processing.sound.*;

Serial myConn;
Sound s;
SinOsc sine;

float distance=1;
float distance_grad=1;
float distance_buffer=1;
float distance_now=1;
float windowAdjustCoord=30;

float x=0;
float y=0;
float xp=0;
float yp=0;
String[] data;
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
  
  float pow=int(data[1])/1000;
  distance_grad=int(distance*pow(10,pow))/pow(10,pow);
  println(distance_grad,distance,pow);
  float freq = map(distance_grad*200000, 0, 1000, 1.0, 0.0);
  if(float(data[2])==1){
    freq = map(0, 0, 1000, 1.0, 0.0);
  }
  sine.freq(freq);
  

  fill(0,255,0);
  stroke(0,255,0);
  
  windowAdjustCoord=height-(distance_grad*(height/4))+100;
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
  
  //delay(10);
}

void serialEvent(Serial conn){
  distance_buffer=distance_now;
  String fromSerial=conn.readString();
  data=split(trim(fromSerial),",");
  //println(data);
  distance_now = float(data[0]);
  
  if(abs(distance_now-distance_buffer)>=0.5){
    distance=distance_buffer;
    distance_now=distance_buffer;
  }
  else{
    distance=distance_now;
  }
  
  //println( distance, distance_now,distance_buffer);
  
  

}
