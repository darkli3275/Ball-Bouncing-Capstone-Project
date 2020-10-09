//Function to calculate where the ball needs to go and apply movement
void plotPath(){
  float d = dist(b1.x,b1.y,mouseX,mouseY); //Get distance from mouse to ball
  b1.xacc = (mouseX - b1.x)/d * speed; //Divide x-axis distance by total distance to get rate of x-travel
  b1.yacc = (mouseY - b1.y)/d * speed; //Divide y-axis distance by total distance to get rate of y-travel
}
