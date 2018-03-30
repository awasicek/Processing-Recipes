// Note: this can be a complicated recipe so it is best to draw and diagram the frame, the x and y axes, etc.

int width = 600;
int height = 800;

void setup()
{
  size(600, 800);
}

int score = 0;

float birdX = 100;
float birdY = 100;

double birdYVelocity = 0;
double gravity = 0.1;

float pipeX = 550;
float pipeY = 800;
float pipeLength = 50;
float pipeHeight = -300;

float pipe2X = 550;
float pipe2Y = 0;
float pipe2Length = 50;
float pipe2Height = 300;

void draw()
{
  background(0, 0, 255);
  
  // draw bird
  fill(255, 0, 0);
  ellipse(birdX, birdY, 20, 20);
  
  // make bird fall down
  birdY += birdYVelocity;
  
  // add gravity to bird
  birdYVelocity += gravity;
  
  // draw a pipe coming up from the ground
  fill(0, 255, 0);
  rect(pipeX, pipeY, pipeLength, pipeHeight); // rect(x, y, width, height)
  
  // draw a second pipe coming down from the sky
  rect(pipe2X, pipe2Y, pipe2Length, pipe2Height);
  
  // make the pipe move from right to left
  pipeX -= 2;
  pipe2X -= 2;
  
  // make the pipe teleport back to the right once it has passed off the left
  if (pipeX <= -50)
  {
    pipeX = 550;
    pipeHeight = random(-100, -400); // make the next pipe have a random height
    
    score += 1; // increment score (this will only happen if the player passed the pipes successfully)
  }
  
  if (pipe2X <= -50)
  {
   pipe2X = 550;
   pipe2Height = random(100, 400);
  }
  
  // make the game end when the bird hits the bottom pipe
  if (intersects(birdX, birdY, pipeX, pipeY, pipeLength, pipeHeight))
  {
    exit();
  }
  
  // make the game end when the bird hits the top pipe
  if (intersects2(birdX, birdY, pipe2X, pipe2Y, pipe2Length, pipe2Height))
  {
    exit();
  }
  
  // display score
  fill(255, 255, 255);
  text("Score: " + score, 50, 50);
  // text(text, xPosition, yPosition)
}

// make the bird jump/flap when the mouse is clicked
void mousePressed() // this method is called whenever the mouse is clicked (see processing documentation)
{
  birdYVelocity -= 7;
}

boolean intersects(float birdX, float birdY, float pipeX, float pipeY, float
pipeLength, float pipeHeight) 
{
     if (birdY > pipeY + pipeHeight && birdX > pipeX && birdX < pipeX +
pipeLength)
           return true;
     else
           return false;
}

boolean intersects2(float birdX, float birdY, float pipeX, float pipeY, float
pipeLength, float pipeHeight) 
{
     if (birdY < pipeY + pipeHeight && birdX > pipeX && birdX < pipeX +
pipeLength)
           return true;
     else
           return false;
}