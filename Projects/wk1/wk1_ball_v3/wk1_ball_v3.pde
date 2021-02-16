//Ball myBall;

ArrayList<Ball> myBalls=new ArrayList<Ball>();

void setup(){
  size(800,600);
  
  //myBall= new Ball();

}

void draw(){
  background(255);
  
  for(Ball myBall:myBalls){
    myBall.display();
    myBall.move();
  }
}

void mouseReleased(){
  myBalls.add(new Ball(mouseX,mouseY));
  
  
}
