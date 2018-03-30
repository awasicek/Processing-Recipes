// Start with a new sketch that contains setup() and draw() methods. 
// Ask your teacher if you don’t know how to do this. The suggestion under each step should help you with your program.

// Save your sketch as frogger inside your processing folder.

  // 3.  Make member variables to keep track of your frog’s hop distance, X and Y position
  int frogStartX = 200;
  int frogStartY = 400;
  int frogX = 200;
  int frogY = 400;
  int frogHop = 15;
  // 9. Create several new Car objects at the top of your sketch.
  Car car1 = new Car(50, 100, 35, 5);
  Car car2 = new Car(300, 300, 30, 2);
  Car car3 = new Car(20, 350, 45, 3);
  
// 1.Make a canvas of size 400x400 for your game. 
// size(width, height)       // in setup method 
// background(red, green, blue)    // in draw method 

void setup()
{
  size(400, 400);
}

void draw()
{
  background(0, 0, 255); 
  
  // 2. Draw a frog on the bottom of the canvas. (It can be a ball for now)
  // fill(red, green, blue)      // in draw method 
  // ellipse(x, y, width, height)     // in draw method 
  fill(0, 255, 0);
  ellipse(frogX, frogY, 25, 25);
  
  // 10. Call the display() method in your draw method for each car. You should see your car appear.
  // 15. In the draw() method, alternate the driving direction of each of your cars to either go left or right. Use the display() method after every drive method. 
  car1.moveLeft();
  car1.display();
  car2.moveRight();
  car2.display();
  car3.moveLeft();
  car3.display();
  
  // 18. Call the intersects method for one of your cars in your draw method.  If the intersects method returns true, return your frog to the starting point. 
  // 19. Repeat step 18 for all of your cars.

  if (intersects(car1))
  {
    frogX = frogStartX;
    frogY = frogStartY;
  }
  if (intersects(car2))
  {
   frogX = frogStartX;
   frogY = frogStartY;
  }
   if (intersects(car3))
  {
   frogX = frogStartX;
   frogY = frogStartY;
  }
  
  // 20. Create a winner banner once you get to the other side 
  if (frogY < 0)
  {
    text("You win!", 25, 25);
    textSize(16);
    frogHop = 0; // so the frog can no longer move
  }
//  text( string message, x, y); 
//  textSize(size); 
  
  frogStay();
}








// 4. Add code to the method below to give our frog movement. 
  
void keyPressed()
{
  if(key == CODED){
      if(keyCode == UP)
      {
      //Frog Y position goes up
      frogY -= frogHop;
      }
      else if(keyCode == DOWN)
      {
        //Frog Y position goes down 
        frogY += frogHop;
      }
      else if(keyCode == RIGHT)
      {
       //Frog X position goes right
       frogX += frogHop;
      }
      else if(keyCode == LEFT)
      {
        //Frog X position goes left
        frogX -= frogHop;
      }
   }
}
  
// 5. Write a method to keep our frog from going outside of the canvas
void frogStay() 
{
 if(frogX > 400)
 {
   frogX = 400;
 }
 else if (frogX < 0)
 {
   frogX = 0;
 }
 if(frogY > 400)
 {
   frogY = 400;
 }
 //else if (frogY < 0)
 //{
 //  frogY = 0;
 //}
}

// 6. Create a Car class inside your sketch. 
//Your Car class will include the car’s position at x, position at y, the size of the car, and the speed of the car.
// 7. Create a constructor inside your Car class that initializes each variable with parameters.
public class Car 
{
  int carX;
  int carY;
  int carSize;
  int carSpeed;
  public Car(int carX, int carY, int carSize, int carSpeed)
  {
    this.carX = carX;
    this.carY = carY;
    this.carSize = carSize;
    this.carSpeed = carSpeed;
  }
  // 8. Copy this functionality in your Car class to display your car position 
  void display() 
  {
   fill(255, 0, 0);
   rect(carX, carY,  carSize, 50);
  }
  
  // 11.  Inside your car class write a method for the car to move to the left with its speed. 
  void moveLeft()
  {
    carX -= carSpeed;
    // 12.  In the same method, do a check if it goes off the canvas to have it return to the rightmost position of your canvas.  (hint: use the width variable)
    if(carX < 0)
    {
      carX = 400;
    }
  }
  
  // 13.  Write a method for the car to move to the right with its speed. 
  void moveRight()
  {
    carX += carSpeed;
    // 14. In the same method, do a check if it goes off the canvas to have it return to the leftmost position of your canvas
    if (carX > 400)
    {
      carX = 0;
    }
  }
  
  // 16. Create a getX(), getY(), and getSize() method in your Car class.
  int getX()
  {
    return carX;
  }
  
  int getY()
  {
    return carY;
  }
  
  int getSize()
  {
    return carSize;
  }
}
    
    
// 17. Check when a car hits your frog. You can use the following intersection method to help. 
boolean intersects(Car car) {
  if ((frogY > car.getY() && frogY < car.getY()+50) && (frogX > car.getX() && frogX < car.getX()+car.getSize())) 

         return true;
   else 
       return false;
}

// Example:
// https://twilight-toe.hyperdev.space


// Copy your code here to make your own frogger webpage!!
// https://hyperdev.com/#!/project/twilight-toe