//Initializing objects and global variables
int t = 1; //Time allowed for ball to travel from starting location to mouse location
int frameT = t * 60; //Time allowed converted into frames for math's sake
float grav; //Gravity
int obstagoons = 4; //# of obstacles
int boosts = 4; //# of boosts
int predicts = 4; //# of prediction balls
int score = 0;
int highscore;
boolean menuUp = false; //Displays instructions or not
Ball b1 = new Ball(); //Player ball
Ball ex1 = new Ball(); //Menu balls
Ball ex2 = new Ball();
Ball ex3 = new Ball();
Ball[] p = new Ball[predicts]; //Predictive aiming balls
Obstacle[] obstacles = new Obstacle[obstagoons]; //Obstacles
Obstacle victor = new Obstacle(); //Victory block
PImage bg; //Background image

//Initialization code - runs once on startup
void setup(){
  //Increased framerate due to slowdown from bg image
  frameRate(120);
  fullScreen();
  
  //Loading bg image & high score
  bg = loadImage("bg.jpg");
  bg.resize(width,height);
  String[] scores = loadStrings("High Score.txt");
  highscore = int(scores[0]);
  
  //Assigning all balls their respective types and positions
  b1.standBall();
  b1.x = width/19;
  b1.y = height/2;
  
  ex1.standBall();
  ex1.x = width/12;
  ex1.y = height/14;
  
  ex2.heavyBall();
  ex2.x = width/6;
  ex2.y = height/14;
  
  ex3.masslessBall();
  ex3.x = width/4;
  ex3.y = height/14;
  
  //Activates victory block
  victor.vObstacle();
  victor.vRandom();
  //Creates obstacle objects in array and randomize their placement
  for(int i=0; i < obstagoons; i++){
    obstacles[i] = new Obstacle();
  }
  for(int i=0; i < obstagoons; i++){
    obstacles[i].randomize();
  }
  //Creates predictive balls in an array
  for(int i=0; i < predicts; i++){
    p[i] = new Ball();
    p[i].predictBall();
  }
}

//Code to be repeated every frame
void draw(){
  //Background & gravity
  image(bg,0,0);
  grav = 9.8/frameT * b1.mass;
  
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
  
  //Displays victory block and checks for win state
  victor.displayObsta();
  victor.wincon();
  
  //Displays obstacles and checks collision
  for(int i=0; i < obstagoons; i++){
    obstacles[i].displayObsta();
    obstacles[i].obstacoll();
  }
  
  //Screen & ball menu collision checks
  edgeCheck();
  menuCheck();
  
  //Displays UI elements (Ball menu, instructional text, instructions menu)
  menuRect();
  menuBalls();
  instructText();
  if(menuUp){
   instructMenu(); 
  }
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
  //Grabs key pressed
  switch(key){
    
    //Menu Toggle
    case 'm':
      menuUp = !menuUp;
      break;
    
    //Ball Reset
    case 'r':
      reset();
      break;
      
    //Level Reset
    case 'h':
      reset();
      newLvl();
      break;
      
    //Boosts
    case 'w':
      boostUP();
      break;
      
    case 's':
      boostDown();
      break;
      
    case 'a':
      boostLeft();
      break;
            
    case 'd':
      boostRight();
      break;
      
    //Exiting
    case 'q':
      quit();
  }
}
