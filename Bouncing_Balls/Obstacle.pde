class Obstacle{
  //x-position, y-position, width, height, colour
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  color c = color(210, 105, 30);
  
  //Function to generate new obstacle object
  Obstacle(){} 
  
  //Differentiates victory block visually
  void vObstacle(){
    c = color(0,255,0);
  }
  
  //Adds to score & generates new level if ball is in victory block bounds
  void wincon(){
    if(b1.x > x-b1.d/2 && b1.x < w+x + b1.d/2){
      if(b1.y > y-b1.d/2 && b1.y < y+h + b1.d/2){
        score += 1;
        score += boosts/2;
        if(score >= highscore){
         highscore = score; 
        }
        reset();
        newLvl();
       }
     }
  }
  
  //Randomization reserved for victory block
  //Checks multiple conditions for badness
  //If bad, re-random & check again
  //If not bad, proceed
  void vRandom(){
    boolean good = false;
    while(good == false){
      //boolean checkO = true;
      boolean checkS = true;
      boolean checkE = true;
      boolean checkM = true;
      x = random(0,width);
      y = random(0,height);
      w = random(width/24,width/21);
      h = random(height/21,height/18);
         
      //Edges of Screen
      if(x < 0 || x+w > width || y < 0 || y+h > height){
        checkE = false;
      }
    
      //Ball Spawn Location
      if(x < width/19 + b1.d/2 && (y+h > b1.y - b1.d/2 || y < b1.y + b1.d/2)){
        checkS = false;
      }
      
      //Menu
      if(x <= width/3 && y <= height/6){
        checkM = false;
      }
      
      //Final Check
      if(checkS && checkE && checkM){
        good = true; 
      }
    }
  }
  
  //Obstacle collision
  //Checks within obstacle bounds, then checks which side the ball is at and which direction it's going in
  //Bounces if ball is going toward the side
  void obstacoll(){
    float areaX = x + w;
    float areaY = y + h;
    if(b1.x > x - b1.d/2 && b1.x < areaX + b1.d/2){
      if(b1.y > y - b1.d/2 && b1.y < areaY + b1.d/2){
        if(b1.x <= x && b1.vX > 0){
          b1.vX *= -1;
          b1.vX += dampener;
        }
        if(b1.x >= areaX && b1.vX < 0){
          b1.vX *= -1; 
          b1.vX += -dampener;
        }
        if(b1.y <= y && b1.vY > 0){
          b1.vY *= -1; 
          b1.vY += dampener;
        }
        if(b1.y >= areaY && b1.vY < 0){
          b1.vY *= -1; 
          b1.vY += -dampener;
        } 
      }
    }
  }
  
  //Obstacle randomizer
  //Similar to victory block randomization but size range increased and added checks for other obstacles & the victory condition
  //Places obstacles off-screen if it fails checks too many times to avoid crashing
  void randomize(){
    boolean good = false;
    int trycount = 0;
    while(good == false){
      boolean checkO = true;
      boolean checkE = true;
      boolean checkS = true;
      boolean checkM = true;
      boolean checkV = true;
      x = random(0,width);
      y = random(0,height);
      w = random(width/12,width/3);
      h = random(height/6,height/3);
      
      for(int a = 0; a < obstagoons; a++){
        //If the horizontal start or end of the obstacle is within another
        if((x > obstacles[a].x && x < obstacles[a].x + obstacles[a].w) || (x+w > obstacles[a].x && x+w < obstacles[a].x + obstacles[a].w)){
          checkO = false;
        }
        //If the vertical start or end of the obstacle is within another
        if((y > obstacles[a].y && y < obstacles[a].y + obstacles[a].h) || (y+h > obstacles[a].y && y+h < obstacles[a].y + obstacles[a].h)){
          checkO = false;
        }
      }
      
      //Edges of Screen
      if(x < 0 || x+w > width || y < 0 || y+h > height){
        checkE = false;
      }
    
      //Ball Spawn Location
      if(x < width/19 + b1.d/2 && (y+h > b1.y - b1.d/2 || y < b1.y + b1.d/2)){
        checkS = false;
      }
      
      //Menu
      if(x <= width/3 && y <= height/6){
        checkM = false;
      }
      
      //Victory Condition
      if((victor.x > x && victor.x < x+w) || (victor.x + victor.w > x && victor.x + victor.w < x+w)){
        checkV = false;
      }
      
      if((victor.y > y && victor.y < y+h) || (victor.y + victor.h > y && victor.y + victor.h < y+h)){
        checkV = false;
      }
      
      //Final Check
      if(checkO && checkE && checkS && checkM && checkV){
        good = true;
      }
      else if(trycount > 100000){
        x = width;
        y = height;
        good = true;
      }
      
      trycount++;
    }
  }

  //Displays obstacles
  void displayObsta(){
   strokeWeight(2);
   stroke(0);
   fill(c);
   rect(x, y, w, h);
  }
}
