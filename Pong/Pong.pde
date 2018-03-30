import ddf.minim.*;
Minim minim;
AudioSample sound;
PImage backgroundImage;

int width = 800;
int height = 600;

void setup()
{
  minim = new Minim (this);
  sound = minim.loadSample("bonk.wav", 128);
  backgroundImage = loadImage("pong-background.jpg");
  size(800, 600);
}

int ballX = 100;
int ballY = 100;
int ballWidth = 50;
int ballHeight = 50;
int speedX = 4;
int speedY = 2;

int paddleY = 550;
int paddleWidth = 150;
int paddleHeight = 50;

void draw()
{
  //background(0, 255, 0);
  image(backgroundImage, 0, 0);
    
  // draw ball
  ellipse(ballX, ballY, ballWidth, ballHeight);
  fill(255, 0, 0);
  stroke(255, 255, 255);
  
  // draw paddle
  rect(mouseX, paddleY, paddleWidth, paddleHeight);
  
  // make the ball move across the screen from left to right
  ballX += speedX; // and make a variable for the speed of the ball
  
  // make the ball bounce off the walls (if the ball hits a side, reverse its speed)
  if (ballX <= 0 || ballX >= 800)
  {
    speedX = -speedX;
  }
  
  // make the ball move up and down
  ballY += speedY;
  
  // make the ball bounce off the top and bottom walls 
  if (ballY <= 0 || ballY >= 600)
  {
    speedY = -speedY;
  }
  
  // make the sound play if the ball hits the bottom
  if (ballY >= 600)
  {
    sound.trigger();
  }
  
  // check to see if the ball hits the paddle
  if (intersects(ballX, ballY, mouseX, paddleY, paddleWidth))
  {
    speedY = -speedY; // if ball hits paddle, reverse the Y component of the ball's speed
  }
}

boolean intersects(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {
  if (ballY > paddleY - 0.5 * paddleHeight && ballX > paddleX && ballX < paddleX + paddleLength)
  {
    return true;
  }
  else
  {
    return false;
  }
}