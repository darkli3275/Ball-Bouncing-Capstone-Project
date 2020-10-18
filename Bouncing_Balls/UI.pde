//Displays grey menu rectangle
void menuRect(){
  fill(170);
  rect(0,0,width/3,height/6);
}
  
//Displays example balls and their explanation text
void menuBalls(){
  ex1.ballDisplay(); ex2.ballDisplay(); ex3.ballDisplay();
  textSize(25); textAlign(CENTER); fill(0);
  text("Standard Ball", ex1.x, ex1.y + 85);
  text("Heavy Ball", ex2.x, ex2.y + 85);
  text("Massless Ball", ex3.x, ex3.y + 85);}
  
//Checks which example ball was clicked in the menu
void menuMouseCheck(){
  
  //Make the ball standard type if click was within ex1's bounds
    if(mouseX < ex1.x+ex1.d/2 && mouseX > ex1.x-ex1.d/2){
      if(mouseY < ex1.y+ex1.d/2 && mouseY > ex1.y-ex1.d/2){
        b1.standBall();}}
        
    //Make the ball heavy type if click was within ex2's bounds
    if(mouseX < ex2.x+ex2.d/2 && mouseX > ex2.x-ex2.d/2){
      if(mouseY < ex2.y+ex2.d/2 && mouseY > ex2.y-ex2.d/2){
        b1.heavyBall();}}
        
    //Make the ball massless type if click was within ex3's bounds
    if(mouseX < ex3.x+ex3.d/2 && mouseX > ex3.x-ex3.d/2){
      if(mouseY < ex3.y+ex3.d/2 && mouseY > ex3.y-ex3.d/2){
        b1.masslessBall();}}
}

//Function for predictive aiming
//Requires inputs for specific ball object and its place in the aiming line
//Multiplies inputted number with a quarter (second) then converts that into frames for math's sake
//Gets y-velocity from repurposed ball lauching code
//Inputs y-velocity into projectile motion formula solved for y-displacement to get expected y-position at a specified time if the ball were lauched at that moment
//Gets x-position by essentially quartering the x-distance and putting the predictive ball at its designated place
//Draws the predictive ball
void predict(Ball p, float place){
  place *= 0.25;
  float placeT = place * 60;
  float dX = mouseX - b1.x;
  float dY = mouseY - b1.y;
  float vY = ((-0.5*grav*(frameT*frameT)) + dY)/frameT;
  p.y = (vY*placeT) + (0.5 * grav * (placeT*placeT)) + b1.y;
  p.x = dX*place + b1.x;
  p.ballDisplay();
}
//Example: The first ball in the order's "place" is 1. That gets changed to 0.25 seconds then to 15 frames (a quarter second).
//Example: That time is inputted into the y-projectile motion formula to get its place at 0.25 seconds if it were launched and puts the predictive ball there.
