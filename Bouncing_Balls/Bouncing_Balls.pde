//60 frames = 1 second

//Initializing objects and global variables
Ball b1 = new Ball(); //Player Ball
Ball ex1 = new Ball(); Ball ex2 = new Ball(); Ball ex3 = new Ball(); //Menu Ball
Ball p1 = new Ball(); Ball p2 = new Ball(); Ball p3 = new Ball(); Ball p4 = new Ball();
float speed = 10;
int t = 1;
int frameT = t * 60;
float grav;

//Initialization code - runs once on startup
void setup(){
  fullScreen();
  //Assigning all balls their respective types and positions
  p1.predictBall(); p2.predictBall(); p3.predictBall(); p4.predictBall();
  b1.standBall(); ex1.standBall(); ex2.heavyBall(); ex3.masslessBall();
  b1.x = width/19; ex1.x = width/12; ex2.x = width/6; ex3.x = width/4;
  b1.y = height/2; ex1.y = height/14; ex2.y = height/14; ex3.y = height/14;
}

//Code to be repeated every frame
void draw(){
  background(0);
  grav = 9.8/60 * b1.mass;
  
  //Displays and moves ball
  b1.ballDisplay();
  move();
  
  if(b1.yacc == 0 && b1.xacc == 0){
    predict(p1, 1);
    predict(p2, 2);
    predict(p3, 3);
    predict(p4, 4);
  }
  
  //Displays menu elements
  menuRect();
  menuBalls();
  
  //Collision checks
  edgeCheck();
  menuCheck();
  gravity();
}

void mouseClicked(){
  //If click was within bounds of ball menu, check which example was clicked
  if(mouseX < width/3 && mouseY < height/6){
    menuMouseCheck();}
  
  //If click was anywhere else on screen, calculate where to go and change the ball's movement
  else{
   go();
}
}

void keyPressed(){
  switch(key){ //Grabs the key pressed
    case 'r':reset(); //If r was pressed, reset the ball's position
  }
}
