
void setup()
{
  size(600, 600);
  background(255, 0, 0);
}

void draw()
{
  // Teaching note: explain how to declare/initialize multiple variables on one line.
  // Draw a diagonal line of ellipses
  //for (int x = 0, y = 0; x < 600 && y < 600; x += 15, y += 15)
  //{
  //      ellipse(x, y, 25, 25);
  //}

  int i = 20;
  fill(0, 0, 255);
  ellipse(getWormX(i), getWormY(i), 25, 25);
  int j = 10000;
  fill(0, 255, 0);
  ellipse(getWormX(j), getWormY(j), 25, 25);
  makeMagical();

}

//float frequency = .001; 
float frequency = .005; 

float noiseInterval = PI;

void makeMagical() {
fill( 0, 0, 0, 10 ); // this sets the color to be used for subsequent shapes (this one is black with an alpha of 10; ie, semi transparent)
rect(0, 0, width, height); // draws a black semi transparent rectangle over the entire canvas (this is what enables the illusion of movement and the fading trails from the shapes)
noStroke();
}

float getWormX(int i) {
return map(noise(i*noiseInterval + frameCount * frequency), 0, 1, 0, width);
}

float getWormY(int i) {
return map(noise(i*noiseInterval+1 + frameCount * frequency), 0, 1, 0, height);
}