//60 frames = 1 second

//Initializing objects and global variables
int t = 1; //Time allowed for ball to travel from starting location to mouse location
int frameT = t * 60; //Allowed time converted into number of frames for math's sake
float grav; //Gravity
int obstagoons = 4; //# of obstacles
int boosts = 4; //# of boosts
int predicts = 4; // # of prediction balls
int score = 0;
Ball b1 = new Ball(); //Player ball
Ball ex1 = new Ball(); //Menu balls
Ball ex2 = new Ball();
Ball ex3 = new Ball();
Ball[] p = new Ball[predicts]; //Predictive aiming balls
Obstacle[] obstacles = new Obstacle[obstagoons]; //Obstacles

//Initialization code - runs once on startup
void setup(){
  fullScreen();
  //Assigning all balls their respective types and positions
  b1.standBall(); ex1.standBall(); ex2.heavyBall(); ex3.masslessBall();
  b1.x = width/19; ex1.x = width/12; ex2.x = width/6; ex3.x = width/4;
  b1.y = height/2; ex1.y = height/14; ex2.y = height/14; ex3.y = height/14;
  
  //Creates obstacle objects in an array and randomize their placement
  for(int i=0; i < obstagoons; i++){
    obstacles[i] = new Obstacle();
    obstacles[i].randomize();
  }
  
  //Checks if randomization overlaps with starting ball
  for(int i=0; i < obstagoons; i++){
    obstacles[i].randomizeCheck();
  }
  
  //Creates predictive balls in an array
  for(int i=0; i < predicts; i++){
    p[i] = new Ball();
    p[i].predictBall();
  }
}

//Code to be repeated every frame
void draw(){
  background(0);
  grav = 9.8/60 * b1.mass;
  
  //Displays and moves ball
  b1.ballDisplay();
  move();
  gravity();
  
  //Displays predictive aiming (Predicts every quarter second)
  if(b1.vX == 0 && b1.vY == 0){
    for(int i=0; i < predicts; i++){
      predict(p[i], i+1);
    }
  }
  
  //Displays obstacles and checks obstacle collision
  for(int i=0; i < obstagoons; i++){
    obstacles[i].displayObsta();
    obstacles[i].obstacoll();
  }
  
  //Collision checks (Screen edges, ball menu)
  edgeCheck();
  menuCheck();
  
  //Displays menu elements (Grey box, example balls)
  menuRect();
  menuBalls();
  
  //Instructional text - y is every 35 pixels
  textSize(25); textAlign(RIGHT); fill(255);
  text("Your Objective is to Hit the Green Goal", width-20, 35);
  text("Click to Launch the Ball", width-20, 70);
  text("Press WASD for a Boost in the Corresponding Direction", width-20, 105);
  text("You Have (" + str(boosts) + ") Boosts Left", width-20, 140);
}

void mouseClicked(){
  //If click was within bounds of ball menu, check which example was clicked
  if(mouseX < width/3 && mouseY < height/6){
    menuMouseCheck();}
  
  //If click was anywhere else on screen, launch the ball with the might of Zeus
  else{
   go();
}
}

void keyPressed(){
  switch(key){ //Grabs the key pressed
    //Ball Reset
    case 'r':
      reset();
      break;
      
    //Level Reset
    case 'h':
      reset();
      for(int i=0; i < obstagoons; i++){
      obstacles[i].randomize();
      obstacles[i].randomizeCheck();
      }
      boosts = 4;
      break;
      
    //Boosts
    case 'w':
      if(boosts > 0){
        b1.vY -= 15;
        boosts -= 1;
        break;
      }
    case 's':
      if(boosts > 0){
       b1.vY += 15;
       boosts -= 1;
       break;
      }
    case 'a':
      if(boosts > 0){
        b1.vX -= 10;
        boosts -= 1;
        break;
      }      
    case 'd':
      if(boosts > 0){
        b1.vX += 10; 
        boosts -= 1;
        break;
      }
  }
}
