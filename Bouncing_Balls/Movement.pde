//Variable initialization (Energy loss on bounce)
float dampener = 1;

//Function to apply ball movement
void move(){
  b1.x += b1.vX;
  b1.y += b1.vY;
}

//Function to check edge collision
//On collision, if ball is moving in direction of wall, reverse direction, remove velocity from the ball
//Then if removing velocity from the ball would make it go backwards, make the velocity zero instead
void edgeCheck(){
  
  //Right edge of screen
  if(b1.x > width - b1.d/2){
    if(b1.vX > 0){
      b1.vX *= -1;
      b1.vX += dampener;
      if(b1.vX > 0){
        b1.vX = 0;
      }
    }
  }
  
  //Left edge of screen
  if(b1.x < 0 + b1.d/2){
    if(b1.vX < 0){
      b1.vX *= -1;
      b1.vX += -dampener;
      if(b1.vX < 0){
        b1.vX = 0;
      }
    }
  }
    
  //Bottom of screen
  if(b1.y > height - b1.d/2){
    if(b1.vY > 0){
      b1.vY *= -1;
      b1.vY += dampener;
      if(b1.vY > 0){
        b1.vY = 0;
      }
    }
  }
  
  //Top of screen
  if(b1.y < 0 + b1.d/2){
    if(b1.vY < 0){
      b1.vY *= -1;
      b1.vY += -dampener;
    }
  }
}

//Collision for ball menu
void menuCheck(){
  if(b1.x < width/3 + b1.d/2 && b1.y < height/6 + b1.d/2){
    if(b1.y > height/6){
      if(b1.vY < 0){
        b1.vY *= -1;
        b1.vY += -dampener;
      }
    }
    if(b1.x > width/3){
      if(b1.vX < 0){
        b1.vX *= -1;
        b1.vX += -dampener;
      }
    }
  }
}

//Function to get ball initial velocity
//Uses projectile motion kinematics formula solved for initial velocity for y-motion
//Uses divides x-distance by alloted time for x-movement/frame
float initvY;
void go(){
  if(b1.vX == 0 && b1.vY == 0){
    float dX = mouseX - b1.x;
    float dY = mouseY - b1.y;
    initvY = ((-0.5*grav*(frameT*frameT)) + dY)/frameT;
    b1.vX = dX/frameT;
    b1.vY = initvY;
  }
}

//Function to apply gravity
void gravity(){
  if(b1.vY != 0 || b1.vX != 0){
    if(b1.y < height - b1.d/2){    
      b1.vY += grav;
    }
  }
}
