import processing.serial.*;

Serial conn;

void setup(){
  size(800,600);
  
  printArray(Serial.list());
  
  //conn = new Serial(this,,9600);
}

void draw(){
  
}
