import ddf.minim.*; // if they do not have minim then go to Sketch > Import Library > Add Library and install minim
Minim minim;
AudioSample sound;

int score = 0;
int height = 600;
int width = 800;

void setup()
{
  size(800, 600); 
  minim = new Minim (this);
  sound = minim.loadSample("water-drop.wav", 128);
}

int rainY = 100;
int ranRainX = (int) random(width);

void draw()
{
  background(0, 255, 0); // set the background color first

  // draw the raindrop
  fill(0, 0, 255);
  ellipse(ranRainX, rainY, 50, 75); 
  stroke(255, 255, 255); 
  
    // draw the bucket
  fill(255, 0, 0);
  rect(mouseX, 500, 100, 125);
  
  // make the raindrop move
  rainY += 2;
  
  // when raindrop reaches the bottom, make it start again at the top at a random x position
  if (rainY == 600) {
    sound.trigger();
    rainY = 0;
    ranRainX = (int) random(width);
  }
  
  // check to see if the player caught the raindrop in the bucket
  checkCatch(ranRainX, rainY);

  // show score on screen
  fill(0, 0, 0);
  textSize(16);
  text("Score: " + score, 20, 20);

}

void checkCatch(int x, int y){
  if (x > mouseX && x < mouseX+100 && y == 500)
  {
    score++;
  }
  println("Your score is now: " + score);
}