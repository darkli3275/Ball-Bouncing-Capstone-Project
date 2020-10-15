class Ball{
//Variable initialization (xy-position, diameter, mass, xy-movement)
  float x, y, d = 100, mass, xacc, yacc;
  color c;
 
//Function to generate new ball
  Ball(){}

//Change ball type functions (standard, heavy, massless)
  void standBall(){
    c = color(0,0,255);
    mass = 1;}
  
  void heavyBall(){
   c = color(255,0,0);
   mass = 2;}
  
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
   fill(c);
   ellipse(x, y, d, d);}
}
