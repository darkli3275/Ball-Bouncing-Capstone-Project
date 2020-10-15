float dampener = 1;

//Function to apply ball movement
void move(){
  b1.x += b1.xacc;
  b1.y += b1.yacc;
}
  
void edgeCheck(){
  //Right of the screen
  if(b1.x > width - b1.d/2){
    if(b1.xacc > 0){
      b1.xacc *= -1;
      b1.xacc += dampener;
      if(b1.xacc > 0){
        b1.xacc = 0;}
    }
  }
  
  //Left of the screen
  if(b1.x < 0 + b1.d/2){
    if(b1.xacc < 0){
      b1.xacc *= -1;
      b1.xacc -= dampener;
      if(b1.xacc < 0){
        b1.xacc = 0;}
      }
    }
    
  //Bottom of the screen
  if(b1.y > height - b1.d/2){
    if(b1.yacc > 0){
      b1.yacc *= -1;
      b1.yacc += dampener;
      if(b1.yacc > 0){
        b1.yacc = 0;}
    }
  }
  
  //Top of the screen
  if(b1.y < 0 + b1.d/2){
    if(b1.yacc < 0){
      b1.yacc *= -1;
      b1.yacc += -dampener;}
  }
}

void menuCheck(){
  if(b1.x < width/3 + b1.d/2 && b1.y < height/6 + b1.d/2){
    if(b1.y > height/6){b1.yacc *= -1;}
    if(b1.x > width/3){b1.xacc *= -1;}
  }
}

float initYAcc;
void go(){
  float dX = mouseX - b1.x;
  float dY = mouseY - b1.y;
  initYAcc = ((-0.5*grav*(frameT*frameT)) + dY)/frameT;
  b1.xacc = dX/frameT;
  b1.yacc = initYAcc;
}

void gravity(){
  if(b1.yacc != 0 || b1.xacc != 0){
    if(b1.y < height - b1.d/2){
      b1.yacc += grav;
    }
  }
}
