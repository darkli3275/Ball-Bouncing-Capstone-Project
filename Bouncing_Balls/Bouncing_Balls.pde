//Setting up objects
Ball b1 = new Ball(); //Ball to be launched
Ball ex1 = new Ball(); Ball ex2 = new Ball(); Ball ex3 = new Ball(); //Balls in the menu

//Initialization code
void setup(){
  fullScreen();
  b1 = new Ball();
  b1.standBall();
  ex1.standBall(); ex2.heavyBall(); ex3.masslessBall();
  ex1.x = width/12; ex2.x = width/6; ex3.x = width/4;
  ex1.y = height/14; ex2.y = height/14; ex3.y = height/14;
}

//Code to be repeated every frame
void draw(){
  background(0);
  
  //Ball draw code
  b1.display();
  b1.move();
  
  //UI draw code
  fill(170);
  rect(0,0,width/3,height/6);
  ex1.display(); ex2.display(); ex3.display();
  
  textSize(25);
  textAlign(CENTER);
  fill(0);
  text("Standard Ball", ex1.x, ex1.y + 85);
  text("Heavy Ball", ex2.x, ex2.y + 85);
  text("Massless Ball", ex3.x, ex3.y + 85);
}

void mouseClicked(){
  if(mouseX < width/3 && mouseY < height/6){
    
    if(mouseX < ex1.x+ex1.r && mouseX > ex1.x-ex1.r){
      if(mouseY < ex1.y+ex1.r && mouseY > ex1.y-ex1.r){
        b1.standBall();}}
    
    if(mouseX < ex2.x+ex2.r && mouseX > ex2.x-ex2.r){
      if(mouseY < ex2.y+ex2.r && mouseY > ex2.y-ex2.r){
        b1.heavyBall();}}
        
    if(mouseX < ex3.x+ex3.r && mouseX > ex3.x-ex3.r){
      if(mouseY < ex3.y+ex3.r && mouseY > ex3.y-ex3.r){
        b1.masslessBall();}}
  }
  
  else{
  float d;
  d = dist(b1.x,b1.y,mouseX,mouseY);
  b1.xacc = (mouseX - b1.x)/d * 5;
  b1.yacc = (mouseY - b1.y)/d * 5;
  }
}

void keyPressed(){
  if(key == 'r'){
    b1.x = 100; b1.y = height/2; b1.xacc = 0; b1.yacc = 0;
  }
}
