//Function for instructions menu
void instructMenu(){
  //Menu centre-screen
  float menuW = 1000;
  float menuH = 500;
  float menuX = width/2 - menuW/2;
  float menuY = height/2 - menuH/2;
  strokeWeight(2); fill(255);
  rect(menuX,menuY,menuW,menuH);
  textAlign(LEFT); fill(0);
  //40 y-increments
  text("This Game is Procedurally Generated", menuX+20, menuY+40);
  text("Your Objective is to Hit the Green Goal", menuX+20, menuY+80);
  text("Click to Launch the Ball", menuX+20, menuY+120);
  text("Change the Type of Your Ball by Clicking it in the Ball Menu", menuX+20, menuY+160);
  text("Press 'WASD' for a Boost in the Corresponding Direction", menuX+20, menuY+200);
  text("Press 'R' to Restart the Current Level", menuX+20, menuY+240);
  text("Press 'H' to Generate a New Level", menuX+20, menuY+280);
  text("Press 'Q' to Quit", menuX+20, menuY+320);
  text("Press 'M' to Close this Window", menuX+20, menuY+360);
  text("For Every 2 Boosts You Don't Use, You Gain an Additional Point", menuX+20, menuY+400);
  text("Feel Free to Browse the Documentation Included With This Program", menuX+20, menuY+480);
}

//Function to reset ball position & boosts
void reset(){
  b1.x = width/18;
  b1.y = height/2;
  b1.vX = 0;
  b1.vY = 0;
  boosts = 4;
}

//Function to randomize for new level
void newLvl(){
  victor.vRandom();
  for(int i=0; i < obstagoons; i++){
    obstacles[i].randomize();
  }
}

//Saves score if better than high score, then quits
void quit(){
  if(score >= highscore){
    String[] save = new String[1];
    save[0] = str(score);
    saveStrings("High Score.txt", save);
  }
  exit();
}

//Boosts
void boostUP(){
  if(boosts > 0){
    b1.vY -= 15;
    boosts -= 1;
  }
}

void boostDown(){
  if(boosts > 0){
    b1.vY += 10;
    boosts -= 1;
  }
}

void boostLeft(){
  if(boosts > 0){
    b1.vX -= 10;
    boosts -= 1;
  }
}

void boostRight(){
  if(boosts > 0){
    b1.vX += 10; 
    boosts -= 1;
  }
}
