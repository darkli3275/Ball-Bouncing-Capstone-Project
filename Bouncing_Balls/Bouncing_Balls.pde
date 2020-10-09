//Initializing objects and global variables
Ball b1 = new Ball(); //Ball to be launched
Ball ex1 = new Ball(); Ball ex2 = new Ball(); Ball ex3 = new Ball(); //Example balls in the menu
float speed = 5;

//Initialization code - runs once on startup
void setup(){
  fullScreen();
  b1 = new Ball(); b1.standBall(); //Game will start with a standard ball
  
//Assigning the example balls their respective types and positions
  ex1.standBall(); ex2.heavyBall(); ex3.masslessBall();
  ex1.x = width/12; ex2.x = width/6; ex3.x = width/4;
  ex1.y = height/14; ex2.y = height/14; ex3.y = height/14;
}

//Code to be repeated every frame
void draw(){
  background(0);
  
  //Displays and moves ball
  b1.display();
  b1.move();
  
  //Displays menu elements
  menuRect();
  menuBalls();
}

void mouseClicked(){
  //If click was within bounds of ball menu, check which example was clicked
  if(mouseX < width/3 && mouseY < height/6){menuCheck();}
  
  //If click was anywhere else on screen, calculate where to go and change the ball's movement
  else{plotPath();}
}

void keyPressed(){
  switch(key){ //Grabs the key pressed
    case 'r':reset(); //If r was pressed, reset the ball's position
  }
}
