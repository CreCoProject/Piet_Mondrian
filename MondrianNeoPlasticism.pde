// Setup the Application
void setup()
{
  // Define the Size of the Canvas
  size(300, 500);
  println();
  println("Press n for Generating a new Image");
  println("Press s to save the Image");
  println("Press q for increase the Alpha Value");
  println("Press a for decrease the Alpha Value"); 
}

float braightness = 255;

void drawDoubleRectangle(int x, int y, float wide, float high)
{
  int colorrandom = int(random(4));
  // Set the Colors in respect to the Color-Number
  switch(colorrandom)
  {
    // Set Color to Read
    case 0: fill(255, 0, 0, braightness); break;
    // Set Color to Green
    case 1: fill(0, 255, 0, braightness); break;
    // Set Color to Yellow
    case 2: fill(255, 255, 0, braightness); break;
    // Set Color to Blue
    case 3: fill(0, 0, 255, braightness); break;
  }
  // Draws the Master Rectangle
  rect(x, y, int(wide), int(high));
  colorrandom = int(random(4));
  // Set the Colors in respect to the Color-Number
  switch(colorrandom)
  {
    // Set Color to Read
    case 0: fill(255, 0, 0, braightness / 1.7); break;
    // Set Color to Green
    case 1: fill(0, 255, 0, braightness / 1.7); break;
    // Set Color to Yellow
    case 2: fill(255, 255, 0, braightness / 1.7); break;
    // Set Color to Blue
    case 3: fill(0, 0, 255, braightness / 1.7); break;
  }
  // Calculating the Parameters for the Slave Rectangle
  // Callculte the x and y Paramters
  // Such that it is placed in the right and below half
  // of master Rectangle 
  int xn = x + int(random(wide/2)) + int(wide/2);
  int yn = y + int(random(high/2)) + int(high/2);
  // Calculating the Paramters for height and width
  // Such that it is more then one third of the master
  // Rectangle
  int widen = int(random(wide*2/3)) + int(wide/3);
  int highn = int(random(high*2/3)) + int(high/3);
  // Draws the slave Rectangle
  rect(xn, yn, widen, highn);
  
}

// Method to generate the new Image
void generate()
{
  // Clear and Set the Backround to Whithe
  background(255);
  // Choose the number of drawing Rectangle Sets 
  int numberOfDoubleRectangles = int(random(12)+24);
  // Iterattes about the Choosen Number of Rectangle Sets
  for( int n = 0; n < numberOfDoubleRectangles; n++)
  {
    // Calculates the width and height of the Rectangle Set
    // So that the Rectangles will good fit on the Canvas
    float wide = max((width/36), random(width/6));
    float heigh = max((height/36), random(height/6));
    // Calculate the x and y Position of the Rectangle Set 
    int x = int(random((width*5/6)-(wide*2)))+(width/12);
    int y = int(random((height*5/6)-(heigh*2)))+(height/12);
    // Calls the drawing Method for the Rectangle Set
    drawDoubleRectangle(x, y, wide, heigh);
  }
}

// Empty draw Method for compatibility with keyPressed
void draw()
{
}

// Menue Methode
void keyPressed()
{
  println();
  println("Press n for Generating a new Image");
  println("Press s to save the Image");
  println("Press q for increase the Alpha Value");
  println("Press a for decrease the Alpha Value"); 
  char keye = key;
  // If n pressed create a new Image
  if(keye == 'n')
  {
    generate();
  }
  // If s pressed save the curent Image 
  if(keye == 's')
  {
    save("MondriansNeoPlasticsm.png");
  }
  // Increase the Alpha Values
  if(keye == 'q')
  {
    braightness = min( 255, braightness *1.1);
    println("The Aplha Values is now: " + braightness);
    println();
    println("Press n for Generating a new Image");
    println("Press s to save the Image");
    println("Press q for increase the Alpha Value");
    println("Press a for decrease the Alpha Value"); 
  }
  // decrase the Aplha Values
  if(keye == 'a')
  {
    braightness = max(0, braightness / 1.1);
    println("The Aplha Values is now: " + braightness);
    println();
    println("Press n for Generating a new Image");
    println("Press s to save the Image");
    println("Press q for increase the Alpha Value");
    println("Press a for decrease the Alpha Value"); 
  }
}
