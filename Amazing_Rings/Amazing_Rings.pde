int x1 = 250;
int x2 = 750;
int speed = 2;

void setup(){
size(1000,500);
}

//Called directly after setup(), the draw() function continuously executes the lines of code contained inside its block until the program is stopped or noLoop() is called. draw() is called automatically and should never be called explicitly. All Processing programs update the screen at the end of draw(), never earlier.
//To stop the code inside of draw() from running continuously, use noLoop(), redraw() and loop(). If noLoop() is used to stop the code in draw() from running, then redraw() will cause the code inside draw() to run a single time, and loop() will cause the code inside draw() to resume running continuously.
//The number of times draw() executes in each second may be controlled with the frameRate() function.
void draw(){
  background(255,0,0); // set the background color
  // make a loop to draw TWO sets of 40 concentric, consecutively smaller circles (hint: use the loop variable to determine the height and width of the circles)
  for(int i = 400; i>0;i-=10){
  noFill(); // disables filling in the geometry to be created
  // syntax for ellipse: ellipse(a, b, c, d) where
  // a is float x-coordinate of the ellipse
  // b is float y-coordinate of the ellipse
  // c is float width of the ellipse by defaultr5
  // d is float height of the ellipse by default
  ellipse(x1,250,i,i); 
  ellipse(x2,250,i,i);
  }
  // change the x position of the concentric circles for next time they are drawn (when draw() executes the lines of code contained inside its block again)
  x1+=speed;
  x2-=speed;
  // reverse the speed if the circles get too close to the edge of the window
  if (x1>750 || x1 <250){
  speed = -speed;
  }
}