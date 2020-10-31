class Ball{
  
//Variable initialization (xy-position, diameter, mass, xy-velocity, colour)
  float x;
  float y;
  float d = 100;
  float mass;
  float vX;
  float vY;
  color c;
 
//Function to generate new ball
  Ball(){}

//Ball type changing functions (standard, heavy, massless, predicting)
  void standBall(){
    c = color(0,0,255);
    mass = 1.5;}
  
  void heavyBall(){
   c = color(255,0,0);
   mass = 3;}
  
  void masslessBall(){
    c = color(255,255,0);
    mass = 0;}
    
  void predictBall(){
   c = color(255);
   d = 25;
  }
  
//Display ball on screen function
  void ballDisplay(){
   strokeWeight(2);
   stroke(0);
   fill(c);
   ellipse(x, y, d, d);}
}
