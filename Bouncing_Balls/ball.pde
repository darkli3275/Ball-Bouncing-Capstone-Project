class Ball{
//Variable initialization (xy-position, radius, mass, xy-movement)
  float x = 100, y = height/2, r = 100, mass, xacc, yacc;
  color c;
 
//Function to generate new ball
  Ball(){
  }

//Function to apply ball movement
  void move(){
    x += xacc;
    y += yacc;
  }

//Ball type & ball check functions
  void standBall(){
    c = color(0,0,255);
    mass = 1;}
  
  void heavyBall(){
   c = color(255,0,0);
   mass = 5;}
  
  void masslessBall(){
    c = color(255,255,0);
    mass = 0;}
  
  void ballCheck(){
    if(key == 's'){
    b1.standBall();}}
  
//Display ball on screen function
  void display(){
   stroke(0);
   strokeWeight(4);
   fill(c);
   ellipse(x, y, r, r);}
}
