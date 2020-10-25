class Obstacle{
  //x-position, y-position, width, height, colour
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  color c = color(210, 105, 30);
  
  Obstacle(){} 
  
  //Obstacle collision
  //Checks within obstacle bounds then checks which side the ball is at and which direction it's going in
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
  
  //Randomizer
  void randomize(){
   x = random(0,width);
   y = random(0,height);
   w = random(width/9,width/obstagoons);
   h = random(height/6,height/obstagoons);
  }
  
  //Checks randomizing for overlaps
  void randomizeCheck(){
    //Starting ball overlap
    while(x < width/19 + b1.d/2 && (y+h > b1.y - b1.d/2 || y < b1.y + b1.d/2)){
      randomize();
    }
   
   //Out of bounds
    if(x + w > width){
      x = width - w;
    }
    if(y + h > height){
      y = height - y;
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
